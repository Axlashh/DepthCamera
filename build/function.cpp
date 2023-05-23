#include "shitMount.h"


void eventCallback(TY_EVENT_INFO* event_info, void* userdata)
{
    if (event_info->eventId == TY_EVENT_DEVICE_OFFLINE) {
        LOGD("=== Event Callback: Device Offline!");
        // Note: 
        //     Please set TY_BOOL_KEEP_ALIVE_ONOFF feature to false if you need to debug with breakpoint!
    }
    else if (event_info->eventId == TY_EVENT_LICENSE_ERROR) {
        LOGD("=== Event Callback: License Error!");
    }
}

void test1(cv::Mat src, string fileName) {
    /*��ȡRGB������ֵ*/
    Mat dst;
    /*src = imread("D:\\��Ե����\\depth_(0.7#0.8#0.9+move)\\00002.jpg", 1);*/
    dst.create(480, 640, 16);
    int height = src.rows;
    int width = src.cols;
    //int cn = src.channels();//ͨ����
    //int a = 256 * 0.3;
    //int b = 256 * 0.6;
    //int c = 256 * 0.1;
    //int d = 256 * 0.9;
    //int fa = (d - c) / (b - a);
    //int fb = (255 - d) / (255 - b);
    for (int row = 0; row < height; row++)
    {
        for (int col = 0; col < width; col++)
        {

            int v = src.at<ushort>(row, col);
            //if(v>4000)
            //    dst.at<ushort>(row, col) = 255;
            //else if(v==0)
            //    dst.at<ushort>(row, col) = 0;
            //else
            //dst.at<ushort>(row, col) = saturate_cast<ushort>(0.05 * v +100);

                //������ж��������и���0.4* v-300
            int blue = saturate_cast<uchar>(0.29 * v - 70);//��һ��ͨ��
            int green = saturate_cast<uchar>(0.25 * v - 120);//�ڶ���ͨ��
            int red = saturate_cast<uchar>(255 - 0.8 * v + 70);//������ͨ��
            if (v > 2800)
            {
                dst.at<Vec3b>(row, col)[0] = saturate_cast<uchar>(0.16 * v - 100);
                dst.at<Vec3b>(row, col)[1] = saturate_cast<uchar>(0.16 * v - 100);
                dst.at<Vec3b>(row, col)[2] = saturate_cast<uchar>(0.16 * v - 100);
            }
            else if (v > 1800)
            {
                dst.at<Vec3b>(row, col)[0] = saturate_cast<uchar>(680 - 0.2 * v);
                dst.at<Vec3b>(row, col)[1] = 0;
                dst.at<Vec3b>(row, col)[2] = saturate_cast<uchar>(680 - 0.2 * v);
            }
            else if (v > 1200)
            {
                dst.at<Vec3b>(row, col)[0] = saturate_cast<uchar>(655 - 0.33 * v);
                dst.at<Vec3b>(row, col)[1] = 0;
                dst.at<Vec3b>(row, col)[2] = 0;
            }
            else if (v > 800)
            {
                dst.at<Vec3b>(row, col)[0] = 0;
                dst.at<Vec3b>(row, col)[1] = saturate_cast<uchar>(655 - 0.5 * v);
                dst.at<Vec3b>(row, col)[2] = 0;
            }
            else if (v > 400)
            {
                dst.at<Vec3b>(row, col)[0] = 0;
                dst.at<Vec3b>(row, col)[1] = saturate_cast<uchar>(455 - 0.5 * v);
                dst.at<Vec3b>(row, col)[2] = saturate_cast<uchar>(455 - 0.5 * v);
            }
            else if (v == 0)
            {
                dst.at<Vec3b>(row, col)[0] = 0;
                dst.at<Vec3b>(row, col)[1] = 0;
                dst.at<Vec3b>(row, col)[2] = 0;
            }
            else {
                dst.at<Vec3b>(row, col)[0] = 0;
                dst.at<Vec3b>(row, col)[1] = 0;
                dst.at<Vec3b>(row, col)[2] = saturate_cast<uchar>(380 - 0.8 * v);
                //cout << v<<endl;
            }
            //else if (blue > 800) {
            //    dst.at<Vec3b>(row, col)[0] = fb * (blue - b) + d;
            //}
            //else
            //    dst.at<Vec3b>(row, col)[0] =255;*/

            //if (green < 800) {
            //if (green > 255) {
            //        dst.at<Vec3b>(row, col)[1] = green;
            //    }
            //else dst.at<Vec3b>(row, col)[1] =  green;

           /* }

            else if (green > b) {
                dst.at<Vec3b>(row, col)[1] = fb * (green - b) + d;
            }
            else
                dst.at<Vec3b>(row, col)[1] = 255;*/

                /*if (red < 800) {*/
              //     
              //      if (red > 255) {
              //          dst.at<Vec3b>(row, col)[2] = 255;
              //      }
              //      else dst.at<Vec3b>(row, col)[2] = red;
              ///*  }
                //else if (red > b) {
                //    dst.at<Vec3b>(row, col)[2] = fb * (red - b) + d;
                //}
                //else
                //    dst.at<Vec3b>(row, col)[2] = 255;*/

        }
    }
    //namedWindow("orignal image", WINDOW_AUTOSIZE);
    //namedWindow("trans image", WINDOW_AUTOSIZE);
    //imshow("orignal image", src);
    //imshow("trans image", dst);
    /*imwrite("D:\\TEST\\raw.jpg", src);*/
    imwrite(fileName, dst);
    waitKey(0);
}

int WriteData(string fileName, cv::Mat& matData)
{
    int retVal = 0;

    // ���ļ�  
    ofstream outFile(fileName.c_str(), ios_base::out);  //���½��򸲸Ƿ�ʽд��  
    if (!outFile.is_open())
    {
        cout << "���ļ�ʧ��" << endl;
        retVal = -1;
        return (retVal);
    }

    // �������Ƿ�Ϊ��  
    if (matData.empty())
    {
        cout << "����Ϊ��" << endl;
        retVal = 1;
        return (retVal);
    }

    // д������  
    for (int r = 0; r < matData.rows; r++)
    {
        for (int c = 0; c < matData.cols; c++)
        {
            ushort data = matData.at<ushort>(r, c);  //��ȡ���ݣ�at<type> - type �Ǿ���Ԫ�صľ������ݸ�ʽ  
            outFile << data << "\t";   //ÿ�������� tab ����  
        }
        outFile << endl;  //����  
    }
    return (retVal);
}
void mix(string fileName1, string fileName2, string fileName3)
{
    Mat src1 = imread(fileName1, 0);
    Mat src2 = imread(fileName2, 0);
    Mat dt;
    addWeighted(src1, 1, src2, 0.8, 0, dt);  //��ռ0.5�İٷֱ����ͼƬ
    resize(src1, src2, Size(640, 480));
    imwrite(fileName3, dt);
    imshow("Img", dt);
    waitKey();

}
int LoadData(string fileName, cv::Mat& matData, int matRows = 0, int matCols = 0, int matChns = 0)
{
    int retVal = 0;

    // ���ļ�  
    ifstream inFile(fileName.c_str(), ios_base::in);
    if (!inFile.is_open())
    {
        cout << "��ȡ�ļ�ʧ��" << endl;
        retVal = -1;
        return (retVal);
    }

    // ��������  
    istream_iterator<ushort> begin(inFile);    //�� float ��ʽȡ�ļ�����������ʼָ��  
    istream_iterator<ushort> end;          //ȡ�ļ�������ֹλ��  
    vector<ushort> inData(begin, end);      //���ļ����ݱ����� std::vector ��  
    cv::Mat tmpMat = cv::Mat(inData);       //�������� std::vector ת��Ϊ cv::Mat  

    // ����������д���  
    //copy(vec.begin(),vec.end(),ostream_iterator<double>(cout,"\t"));   

    // ����趨�ľ���ߴ��ͨ����  
    size_t dataLength = inData.size();
    //1.ͨ����  
    //if (matChns == 0)
    //{
    //    matChns = 1;

    //}

    //2.������  
    if (matRows != 0 && matCols == 0)
    {
        matCols = dataLength / matChns / matRows;
    }
    else if (matCols != 0 && matRows == 0)
    {
        matRows = dataLength / matChns / matCols;
    }
    else if (matCols == 0 && matRows == 0)
    {
        matRows = dataLength / matChns;
        matCols = 1;
    }
    //3.�����ܳ���  
    if (dataLength != (matRows * matCols * matChns))
    {
        cout << "��������ݳ��� ������ �趨�ľ���ߴ���ͨ����Ҫ�󣬽���Ĭ�Ϸ�ʽ�������" << endl;
        retVal = 1;
        matChns = 1;
        matRows = dataLength;
    }

    // ���ļ����ݱ������������  
    matData = tmpMat.reshape(matChns, matRows).clone();

    return (retVal);
}
void trans(string fileName1, string fileName2)
{
    cv::Mat  irl;
    LoadData(fileName1, irl, 480, 640, 1);
    ofstream Fs(fileName2);
    int height = irl.rows;
    int width = irl.cols;
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            Fs << (int)irl.ptr<ushort>(i)[j] << '\t';
        }
        Fs << endl;
    }
    Fs.close();
}

void joint(string fileName1, string fileName2, string path)
{
    Mat img1 = imread(fileName1);
    Mat img2 = imread(fileName2);
    vector<Mat>vImgs;
    Mat result;
    vImgs.push_back(img1);
    vImgs.push_back(img2);
    // vconcat(vImgs, result); //��ֱ����ƴ��
    hconcat(vImgs, result); //ˮƽ����ƴ��
    imwrite(path, result);
}