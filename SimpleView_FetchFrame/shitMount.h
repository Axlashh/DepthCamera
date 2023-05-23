
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
    int tm_sec;  /*秒，正常范围0-59， 但允许至61*/
    int tm_min;  /*分钟，0-59*/
    int tm_hour; /*小时， 0-23*/
    int tm_mday; /*日，即一个月中的第几天，1-31*/
    int tm_mon;  /*月， 从一月算起，0-11*/
    int tm_year;  /*年， 从1900至今已经多少年*/
    int tm_wday; /*星期，一周中的第几天， 从星期日算起，0-6*/
    int tm_yday; /*从今年1月1日到目前的天数，范围0-365*/
    int tm_isdst; /*日光节约时间的旗标*/
};



void eventCallback(TY_EVENT_INFO* event_info, void* userdata);
//void test1(cv::Mat src, string fileName);
int WriteData(string fileName, cv::Mat& matData);
//void mix(string fileName1, string fileName2, string fileName3);
int LoadData(string fileName, cv::Mat& matData, int matRows = 0, int matCols = 0, int matChns = 0);
//void trans(string fileName1, string fileName2);
//void joint(string fileName1, string fileName2, string path);

#endif