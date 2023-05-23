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

int LoadData(string fileName, cv::Mat& matData, int matRows, int matCols, int matChns)
{
    int retVal = 0;

    // 打开文件  
    ifstream inFile(fileName.c_str(), ios_base::in);
    if (!inFile.is_open())
    {
        cout << "读取文件失败" << endl;
        retVal = -1;
        return (retVal);
    }

    // 载入数据  
    istream_iterator<float> begin(inFile);    //按 float 格式取文件数据流的起始指针  
    istream_iterator<float> end;          //取文件流的终止位置  
    vector<float> inData(begin, end);      //将文件数据保存至 std::vector 中  
    cv::Mat tmpMat = cv::Mat(inData);       //将数据由 std::vector 转换为 cv::Mat  

    // 输出到命令行窗口  
    //copy(vec.begin(),vec.end(),ostream_iterator<double>(cout,"\t"));   

    // 检查设定的矩阵尺寸和通道数  
    size_t dataLength = inData.size();
    //1.通道数  
    if (matChns == 0)
    {
        matChns = 1;
    }
    //2.行列数  
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
    //3.数据总长度  
    if (dataLength != (matRows * matCols * matChns))
    {
        cout << "读入的数据长度 不满足 设定的矩阵尺寸与通道数要求，将按默认方式输出矩阵！" << endl;
        retVal = 1;
        matChns = 1;
        matRows = dataLength;
    }

    // 将文件数据保存至输出矩阵  
    matData = tmpMat.reshape(matChns, matRows).clone();

    return (retVal);
}

int WriteData(string fileName, cv::Mat& matData)
{
    int retVal = 0;

    // 打开文件  
    ofstream outFile(fileName.c_str(), ios_base::out);  //按新建或覆盖方式写入  
    if (!outFile.is_open())
    {
        cout << "打开文件失败" << endl;
        retVal = -1;
        return (retVal);
    }

    // 检查矩阵是否为空  
    if (matData.empty())
    {
        cout << "矩阵为空" << endl;
        retVal = 1;
        return (retVal);
    }

    // 写入数据  
    for (int r = 0; r < matData.rows; r++)
    {
        for (int c = 0; c < matData.cols; c++)
        {
            ushort data = matData.at<ushort>(r, c);  //读取数据，at<type> - type 是矩阵元素的具体数据格式  
            outFile << data << "\t";   //每列数据用 tab 隔开  
        }
        outFile << endl;  //换行  
    }
    return (retVal);
}