
#ifndef __shitMount__
#define __shitMount__

#include "../common/common.hpp"
#include<iostream>
#include<string>
#include<sstream>
#include <fstream>
#include <iostream>
#include<opencv2/opencv.hpp>
#include<stdio.h>
#include <io.h>
#include <time.h>
#include <Shlwapi.h>
#pragma comment(lib,"Shlwapi.lib")
using namespace std;
using namespace cv;

struct tm1
{
    int tm_sec;  /*�룬������Χ0-59�� ��������61*/
    int tm_min;  /*���ӣ�0-59*/
    int tm_hour; /*Сʱ�� 0-23*/
    int tm_mday; /*�գ���һ�����еĵڼ��죬1-31*/
    int tm_mon;  /*�£� ��һ������0-11*/
    int tm_year;  /*�꣬ ��1900�����Ѿ�������*/
    int tm_wday; /*���ڣ�һ���еĵڼ��죬 ������������0-6*/
    int tm_yday; /*�ӽ���1��1�յ�Ŀǰ����������Χ0-365*/
    int tm_isdst; /*�չ��Լʱ������*/
};



void eventCallback(TY_EVENT_INFO* event_info, void* userdata);
//void test1(cv::Mat src, string fileName);
int WriteData(string fileName, cv::Mat& matData);
//void mix(string fileName1, string fileName2, string fileName3);
int LoadData(string fileName, cv::Mat& matData, int matRows = 0, int matCols = 0, int matChns = 0);
//void trans(string fileName1, string fileName2);
//void joint(string fileName1, string fileName2, string path);

#endif