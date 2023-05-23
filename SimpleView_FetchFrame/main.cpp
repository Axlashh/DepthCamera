#include "shitMount.h"

char key;
bool exit_main;
int pic_max = -1;
int count_right;
int count_left;
int count_data;
int count_depth;
char image_left[100];
char image_right[100];
char image_depth[100];
char data_depth[100];
char save_left[256];
char save_depth[256];
char save_data[256];

int main(int argc, char* argv[])
{
    time_t timep;
    struct tm* p;
    time(&timep); //获取从1970至今过了多少秒，存入time_t类型的timep
    p = localtime(&timep);//用localtime将秒数转化为struct tm结构体
    sprintf(save_left, "D:\\AAAAAAA\\documents\\scitri\\data\\left\\%d.%d.%d %d：%02d\\", 1900 + p->tm_year, 1 + p->tm_mon, p->tm_mday, p->tm_hour, p->tm_min);
    LPCSTR pcstr = save_left;    // cv::String to LPCSTR
    if (!PathIsDirectory(pcstr))
    {
        ::CreateDirectory(pcstr, NULL);
    }
    sprintf(save_depth, "D:\\AAAAAAA\\documents\\scitri\\data\\depth\\%d.%d.%d %d：%02d\\", 1900 + p->tm_year, 1 + p->tm_mon, p->tm_mday, p->tm_hour, p->tm_min);
    LPCSTR pcstr1 = save_depth;    // cv::String to LPCSTR
    if (!PathIsDirectory(pcstr1))
    {
        ::CreateDirectory(pcstr1, NULL);
    }
    sprintf(save_data, "D:\\AAAAAAA\\documents\\scitri\\data\\data\\%d.%d.%d %d：%02d\\", 1900 + p->tm_year, 1 + p->tm_mon, p->tm_mday, p->tm_hour, p->tm_min);
    LPCSTR pcstr2 = save_data;    // cv::String to LPCSTR
    if (!PathIsDirectory(pcstr2))
    {
        ::CreateDirectory(pcstr2, NULL);
    }
    cv::VideoCapture capture(1);
    capture.set(cv::VideoCaptureProperties::CAP_PROP_FPS, 30);
    capture.set(cv::VideoCaptureProperties::CAP_PROP_EXPOSURE, 0);
    std::string ID, IP;
    TY_INTERFACE_HANDLE hIface = NULL;
    TY_ISP_HANDLE hColorIspHandle = NULL;
    TY_DEV_HANDLE hDevice = NULL;
    int32_t color, ir, depth;
    color = ir = depth = 1;

    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "-id") == 0) {
            ID = argv[++i];
        }
        else if (strcmp(argv[i], "-ip") == 0) {
            IP = argv[++i];
        }
        else if (strcmp(argv[i], "-color=off") == 0) {
            color = 0;
        }
        else if (strcmp(argv[i], "-depth=off") == 0) {
            depth = 0;
        }
        else if (strcmp(argv[i], "-ir=off") == 0) {
            ir = 0;
        }
        else if (strcmp(argv[i], "-h") == 0) {
            LOGI("Usage: SimpleView_FetchFrame [-h] [-id <ID>] [-ip <IP>]");
            return 0;
        }
    }

    if (!color && !depth && !ir) {
        LOGD("At least one component need to be on");
        return -1;
    }

    LOGD("Init lib");
    ASSERT_OK(TYInitLib());
    TY_VERSION_INFO ver;
    ASSERT_OK(TYLibVersion(&ver));
    LOGD("     - lib version: %d.%d.%d", ver.major, ver.minor, ver.patch);

    std::vector<TY_DEVICE_BASE_INFO> selected;
    ASSERT_OK(selectDevice(TY_INTERFACE_ALL, ID, IP, 1, selected));
    ASSERT(selected.size() > 0);
    TY_DEVICE_BASE_INFO& selectedDev = selected[0];

    ASSERT_OK(TYOpenInterface(selectedDev.iface.id, &hIface));
    ASSERT_OK(TYOpenDevice(hIface, selectedDev.id, &hDevice));

    int32_t allComps;
    ASSERT_OK(TYGetComponentIDs(hDevice, &allComps));

    ///try to enable color camera
    if (allComps & TY_COMPONENT_RGB_CAM && color) {
        LOGD("Has RGB camera, open RGB cam");
        ASSERT_OK(TYEnableComponents(hDevice, TY_COMPONENT_RGB_CAM));
        //create a isp handle to convert raw image(color bayer format) to rgb image
        ASSERT_OK(TYISPCreate(&hColorIspHandle));
        //Init code can be modified in common.hpp
        //NOTE: Should set RGB image format & size before init ISP
        ASSERT_OK(ColorIspInitSetting(hColorIspHandle, hDevice));
        //You can  call follow function to show  color isp supported features
#if 0
        ColorIspShowSupportedFeatures(hColorIspHandle);
#endif
        //You can turn on auto exposure function as follow ,but frame rate may reduce .
        //Device may be casually stucked  1~2 seconds while software is trying to adjust device exposure time value
#if 0
        ASSERT_OK(ColorIspInitAutoExposure(hColorIspHandle, hDevice));
#endif
    }

    if (allComps & TY_COMPONENT_IR_CAM_LEFT && ir) {
        LOGD("Has IR left camera, open IR left cam");
        ASSERT_OK(TYEnableComponents(hDevice, TY_COMPONENT_IR_CAM_LEFT));
    }

    if (allComps & TY_COMPONENT_IR_CAM_RIGHT && ir) {
        LOGD("Has IR right camera, open IR right cam");
        ASSERT_OK(TYEnableComponents(hDevice, TY_COMPONENT_IR_CAM_RIGHT));
    }

    //try to enable depth map
    LOGD("Configure components, open depth cam");
    DepthViewer depthViewer("Depth");
    if (allComps & TY_COMPONENT_DEPTH_CAM && depth) {
        int32_t image_mode;
        ASSERT_OK(get_default_image_mode(hDevice, TY_COMPONENT_DEPTH_CAM, image_mode));
        LOGD("Select Depth Image Mode: %dx%d", TYImageWidth(image_mode), TYImageHeight(image_mode));
        ASSERT_OK(TYSetEnum(hDevice, TY_COMPONENT_DEPTH_CAM, TY_ENUM_IMAGE_MODE, image_mode));
        ASSERT_OK(TYEnableComponents(hDevice, TY_COMPONENT_DEPTH_CAM));

        //depth map pixel format is uint16_t ,which default unit is  1 mm
        //the acutal depth (mm)= PixelValue * ScaleUnit 
        float scale_unit = 1.;
        TYGetFloat(hDevice, TY_COMPONENT_DEPTH_CAM, TY_FLOAT_SCALE_UNIT, &scale_unit);
        depthViewer.depth_scale_unit = scale_unit;
    }



    LOGD("Prepare image buffer");
    uint32_t frameSize;
    ASSERT_OK(TYGetFrameBufferSize(hDevice, &frameSize));
    LOGD("     - Get size of framebuffer, %d", frameSize);

    LOGD("     - Allocate & enqueue buffers");
    char* frameBuffer[2];
    frameBuffer[0] = new char[frameSize];
    frameBuffer[1] = new char[frameSize];
    LOGD("     - Enqueue buffer (%p, %d)", frameBuffer[0], frameSize);
    ASSERT_OK(TYEnqueueBuffer(hDevice, frameBuffer[0], frameSize));
    LOGD("     - Enqueue buffer (%p, %d)", frameBuffer[1], frameSize);
    ASSERT_OK(TYEnqueueBuffer(hDevice, frameBuffer[1], frameSize));

    LOGD("Register event callback");
    ASSERT_OK(TYRegisterEventCallback(hDevice, eventCallback, NULL));

    bool hasTrigger;
    ASSERT_OK(TYHasFeature(hDevice, TY_COMPONENT_DEVICE, TY_STRUCT_TRIGGER_PARAM, &hasTrigger));
    if (hasTrigger) {
        LOGD("Disable trigger mode");
        TY_TRIGGER_PARAM trigger;
        trigger.mode = TY_TRIGGER_MODE_OFF;
        ASSERT_OK(TYSetStruct(hDevice, TY_COMPONENT_DEVICE, TY_STRUCT_TRIGGER_PARAM, &trigger, sizeof(trigger)));
    }

    LOGD("Start capture");
    ASSERT_OK(TYStartCapture(hDevice));


    LOGD("While loop to fetch frame");
    
    TY_FRAME_DATA frame;
    int index = 0;
    int count_pic = 0;
    while (!exit_main) {
        if (pic_max != -1) {
            if (count_pic == pic_max) break;
            count_pic++;
        }
        sprintf(save_left, "D:\\AAAAAAA\\documents\\scitri\\data\\left\\%d.%d.%d %d：%02d\\", 1900 + p->tm_year, 1 + p->tm_mon, p->tm_mday, p->tm_hour, p->tm_min);
        sprintf(save_depth, "D:\\AAAAAAA\\documents\\scitri\\data\\depth\\%d.%d.%d %d：%02d\\", 1900 + p->tm_year, 1 + p->tm_mon, p->tm_mday, p->tm_hour, p->tm_min);
        sprintf(save_data, "D:\\AAAAAAA\\documents\\scitri\\data\\data\\%d.%d.%d %d：%02d\\", 1900 + p->tm_year, 1 + p->tm_mon, p->tm_mday, p->tm_hour, p->tm_min);

        int err = TYFetchFrame(hDevice, &frame, -1);
        if (err == TY_STATUS_OK) {
            LOGD("Get frame %d", ++index);

            int fps = get_fps();
            if (fps > 0) {
                LOGI("fps: %d", fps);
            }

            cv::Mat depth, irl, irr, color;
            parseFrame(frame, &depth, &irl, &irr, &color, hColorIspHandle);
            key = cv::waitKey(1);
            if (key == 27) //按下ESC退出
                break;

            if (!irl.empty()) {
                cv::imshow("LeftIR", irl);
                sprintf_s(image_left, "%05d.jpg", ++count_left);
                strcat(save_left, image_left);
                cv::imwrite(save_left, irl);
            }
            //if(!irr.empty()){ cv::imshow("RightIR", irr); 

            //    sprintf_s(image_right, "%05d.jpg", ++count2);
            //    cv::imwrite(image_right, irr);
            //
            //}
            if (!depth.empty()) {
                depthViewer.show(depth);
                sprintf_s(image_depth, "%05d.jpg", ++count_depth);
                sprintf_s(data_depth, "%05d.txt", ++count_data);
                strcat(save_depth, image_depth);
                strcat(save_data, data_depth);
                imwrite(save_depth, depth);
                WriteData(save_data, depth);
            }
            key = waitKey(1);
            switch (key & 0xff) {
            case 0xff:
                break;
            case 'q':
                exit_main = true;
                break;
            default:
                LOGD("Unmapped key %d", key);
            }
            TYISPUpdateDevice(hColorIspHandle);
            LOGD("Re-enqueue buffer(%p, %d)"
                , frame.userBuffer, frame.bufferSize);
            ASSERT_OK(TYEnqueueBuffer(hDevice, frame.userBuffer, frame.bufferSize));
        }

    }

    ASSERT_OK(TYStopCapture(hDevice));
    ASSERT_OK(TYCloseDevice(hDevice));
    ASSERT_OK(TYCloseInterface(hIface));
    ASSERT_OK(TYISPRelease(&hColorIspHandle));
    ASSERT_OK(TYDeinitLib());
    delete frameBuffer[0];
    delete frameBuffer[1];

    LOGD("Main done!");
    return 0;
}


//
//int main(int argc, char* argv[])
//{
//    std::string ID, IP;
//    TY_INTERFACE_HANDLE hIface = NULL;
//    TY_ISP_HANDLE hColorIspHandle = NULL;
//    TY_DEV_HANDLE hDevice = NULL;
//    int32_t color, ir, depth;
//    color = ir = depth = 1;
//
//    for(int i = 1; i < argc; i++) {
//        if(strcmp(argv[i], "-id") == 0){
//            ID = argv[++i];
//        } else if(strcmp(argv[i], "-ip") == 0) {
//            IP = argv[++i];
//        } else if(strcmp(argv[i], "-color=off") == 0) {
//            color = 0;
//        } else if(strcmp(argv[i], "-depth=off") == 0) {
//            depth = 0;
//        } else if(strcmp(argv[i], "-ir=off") == 0) {
//            ir = 0;
//        } else if(strcmp(argv[i], "-h") == 0) {
//            LOGI("Usage: SimpleView_FetchFrame [-h] [-id <ID>] [-ip <IP>]");
//            return 0;
//        }
//    }
//
//    if (!color && !depth && !ir) {
//        LOGD("At least one component need to be on");
//        return -1;
//    }
//
//    LOGD("Init lib");
//    ASSERT_OK( TYInitLib() );
//    TY_VERSION_INFO ver;
//    ASSERT_OK( TYLibVersion(&ver) );
//    LOGD("     - lib version: %d.%d.%d", ver.major, ver.minor, ver.patch);
//
//    std::vector<TY_DEVICE_BASE_INFO> selected;
//    ASSERT_OK( selectDevice(TY_INTERFACE_ALL, ID, IP, 1, selected) );
//    ASSERT(selected.size() > 0);
//    TY_DEVICE_BASE_INFO& selectedDev = selected[0];
//
//    ASSERT_OK( TYOpenInterface(selectedDev.iface.id, &hIface) );
//    ASSERT_OK( TYOpenDevice(hIface, selectedDev.id, &hDevice) );
//
//    int32_t allComps;
//    ASSERT_OK( TYGetComponentIDs(hDevice, &allComps) );
//
//    ///try to enable color camera
//    if(allComps & TY_COMPONENT_RGB_CAM  && color) {
//        LOGD("Has RGB camera, open RGB cam");
//        ASSERT_OK( TYEnableComponents(hDevice, TY_COMPONENT_RGB_CAM) );
//        //create a isp handle to convert raw image(color bayer format) to rgb image
//        ASSERT_OK(TYISPCreate(&hColorIspHandle));
//        //Init code can be modified in common.hpp
//        //NOTE: Should set RGB image format & size before init ISP
//        ASSERT_OK(ColorIspInitSetting(hColorIspHandle, hDevice));
//        //You can  call follow function to show  color isp supported features
//#if 0
//        ColorIspShowSupportedFeatures(hColorIspHandle);
//#endif
//        //You can turn on auto exposure function as follow ,but frame rate may reduce .
//        //Device may be casually stucked  1~2 seconds while software is trying to adjust device exposure time value
//#if 0
//        ASSERT_OK(ColorIspInitAutoExposure(hColorIspHandle, hDevice));
//#endif
//    }
//
//    if (allComps & TY_COMPONENT_IR_CAM_LEFT && ir) {
//        LOGD("Has IR left camera, open IR left cam");
//        ASSERT_OK(TYEnableComponents(hDevice, TY_COMPONENT_IR_CAM_LEFT));
//    }
//
//    if (allComps & TY_COMPONENT_IR_CAM_RIGHT && ir) {
//        LOGD("Has IR right camera, open IR right cam");
//        ASSERT_OK(TYEnableComponents(hDevice, TY_COMPONENT_IR_CAM_RIGHT));
//    }
//
//    //try to enable depth map
//    LOGD("Configure components, open depth cam");
//    DepthViewer depthViewer("Depth");
//    if (allComps & TY_COMPONENT_DEPTH_CAM && depth) {
//        int32_t image_mode;
//        ASSERT_OK(get_default_image_mode(hDevice, TY_COMPONENT_DEPTH_CAM, image_mode));
//        LOGD("Select Depth Image Mode: %dx%d", TYImageWidth(image_mode), TYImageHeight(image_mode));
//        ASSERT_OK(TYSetEnum(hDevice, TY_COMPONENT_DEPTH_CAM, TY_ENUM_IMAGE_MODE, image_mode));
//        ASSERT_OK(TYEnableComponents(hDevice, TY_COMPONENT_DEPTH_CAM));
//
//        //depth map pixel format is uint16_t ,which default unit is  1 mm
//        //the acutal depth (mm)= PixelValue * ScaleUnit 
//        float scale_unit = 1.;
//        TYGetFloat(hDevice, TY_COMPONENT_DEPTH_CAM, TY_FLOAT_SCALE_UNIT, &scale_unit);
//        depthViewer.depth_scale_unit = scale_unit;
//    }
//
//
//
//    LOGD("Prepare image buffer");
//    uint32_t frameSize;
//    ASSERT_OK( TYGetFrameBufferSize(hDevice, &frameSize) );
//    LOGD("     - Get size of framebuffer, %d", frameSize);
//
//    LOGD("     - Allocate & enqueue buffers");
//    char* frameBuffer[2];
//    frameBuffer[0] = new char[frameSize];
//    frameBuffer[1] = new char[frameSize];
//    LOGD("     - Enqueue buffer (%p, %d)", frameBuffer[0], frameSize);
//    ASSERT_OK( TYEnqueueBuffer(hDevice, frameBuffer[0], frameSize) );
//    LOGD("     - Enqueue buffer (%p, %d)", frameBuffer[1], frameSize);
//    ASSERT_OK( TYEnqueueBuffer(hDevice, frameBuffer[1], frameSize) );
//
//    LOGD("Register event callback");
//    ASSERT_OK(TYRegisterEventCallback(hDevice, eventCallback, NULL));
//
//    bool hasTrigger;
//    ASSERT_OK(TYHasFeature(hDevice, TY_COMPONENT_DEVICE, TY_STRUCT_TRIGGER_PARAM, &hasTrigger));
//    if (hasTrigger) {
//        LOGD("Disable trigger mode");
//        TY_TRIGGER_PARAM trigger;
//        trigger.mode = TY_TRIGGER_MODE_OFF;
//        ASSERT_OK(TYSetStruct(hDevice, TY_COMPONENT_DEVICE, TY_STRUCT_TRIGGER_PARAM, &trigger, sizeof(trigger)));
//    }
//
//    LOGD("Start capture");
//    ASSERT_OK( TYStartCapture(hDevice) );
//
//    LOGD("While loop to fetch frame");
//    bool exit_main = false;
//    TY_FRAME_DATA frame;
//    int index = 0;
//    while(!exit_main) {
//        int err = TYFetchFrame(hDevice, &frame, -1);
//        if( err == TY_STATUS_OK ) {
//            LOGD("Get frame %d", ++index);
//
//            int fps = get_fps();
//            if (fps > 0){
//                LOGI("fps: %d", fps);
//            }
//
//            cv::Mat depth, irl, irr, color;
//            parseFrame(frame, &depth, &irl, &irr, &color, hColorIspHandle);
//            if(!depth.empty()){
//                depthViewer.show(depth);
//            }
//            if(!irl.empty()){ cv::imshow("LeftIR", irl); }
//            if(!irr.empty()){ cv::imshow("RightIR", irr); }
//            if(!color.empty()){ cv::imshow("Color", color); }
//
//            int key = cv::waitKey(1);
//            switch(key & 0xff) {
//            case 0xff:
//                break;
//            case 'q':
//                exit_main = true;
//                break;
//            default:
//                LOGD("Unmapped key %d", key);
//            }
//
//            TYISPUpdateDevice(hColorIspHandle);
//            LOGD("Re-enqueue buffer(%p, %d)"
//                , frame.userBuffer, frame.bufferSize);
//            ASSERT_OK( TYEnqueueBuffer(hDevice, frame.userBuffer, frame.bufferSize) );
//        }
//    }
//    ASSERT_OK( TYStopCapture(hDevice) );
//    ASSERT_OK( TYCloseDevice(hDevice));
//    ASSERT_OK( TYCloseInterface(hIface) );
//    ASSERT_OK(TYISPRelease(&hColorIspHandle));
//    ASSERT_OK( TYDeinitLib() );
//    delete frameBuffer[0];
//    delete frameBuffer[1];
//
//    LOGD("Main done!");
//    return 0;
//}
