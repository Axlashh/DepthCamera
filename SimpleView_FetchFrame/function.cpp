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

    // ���ļ�  
    ifstream inFile(fileName.c_str(), ios_base::in);
    if (!inFile.is_open())
    {
        cout << "��ȡ�ļ�ʧ��" << endl;
        retVal = -1;
        return (retVal);
    }

    // ��������  
    istream_iterator<float> begin(inFile);    //�� float ��ʽȡ�ļ�����������ʼָ��  
    istream_iterator<float> end;          //ȡ�ļ�������ֹλ��  
    vector<float> inData(begin, end);      //���ļ����ݱ����� std::vector ��  
    cv::Mat tmpMat = cv::Mat(inData);       //�������� std::vector ת��Ϊ cv::Mat  

    // ����������д���  
    //copy(vec.begin(),vec.end(),ostream_iterator<double>(cout,"\t"));   

    // ����趨�ľ���ߴ��ͨ����  
    size_t dataLength = inData.size();
    //1.ͨ����  
    if (matChns == 0)
    {
        matChns = 1;
    }
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