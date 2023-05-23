# Install script for directory: D:/AAAAAAA/software/PERCIPIO/camport3-master/sample

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/Project")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples/common" TYPE FILE FILES
    "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/common/BayerISP.hpp"
    "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/common/CommandLineFeatureHelper.hpp"
    "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/common/CommandLineParser.hpp"
    "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/common/DepthInpainter.cpp"
    "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/common/DepthInpainter.hpp"
    "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/common/DepthRender.hpp"
    "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/common/ImageSpeckleFilter.cpp"
    "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/common/ImageSpeckleFilter.hpp"
    "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/common/MatViewer.cpp"
    "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/common/MatViewer.hpp"
    "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/common/TYThread.cpp"
    "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/common/TYThread.hpp"
    "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/common/Utils.hpp"
    "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/common/common.hpp"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/DumpAllFeatures.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/DumpAllFeatures.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/DumpAllFeatures.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/DumpAllFeatures.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/ListDevices.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/ListDevices.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/ListDevices.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/ListDevices.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/LoopDetect.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/LoopDetect.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/LoopDetect.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/LoopDetect.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/ForceDeviceIP.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/ForceDeviceIP.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/ForceDeviceIP.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/ForceDeviceIP.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_FetchFrame.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_FetchFrame.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_FetchFrame.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_FetchFrame.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_Callback.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_Callback.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_Callback.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_Callback.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_Registration.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_Registration.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_Registration.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_Registration.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_FetchHisto.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_FetchHisto.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_FetchHisto.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_FetchHisto.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_MultiDevice.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_MultiDevice.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_MultiDevice.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_MultiDevice.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_TriggerMode0.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_TriggerMode0.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_TriggerMode0.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_TriggerMode0.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_TriggerMode1.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_TriggerMode1.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_TriggerMode1.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_TriggerMode1.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_TriggerMode18.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_TriggerMode18.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_TriggerMode18.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_TriggerMode18.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_TriggerMode19.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_TriggerMode19.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_TriggerMode19.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_TriggerMode19.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_TriggerMode20.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_TriggerMode20.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_TriggerMode20.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_TriggerMode20.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_TriggerMode21.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_TriggerMode21.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_TriggerMode21.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_TriggerMode21.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_TriggerMode_M2S1.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_TriggerMode_M2S1.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_TriggerMode_M2S1.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_TriggerMode_M2S1.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_TriggerMode_M3S1.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_TriggerMode_M3S1.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_TriggerMode_M3S1.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_TriggerMode_M3S1.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_TriggerDelay.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_TriggerDelay.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_TriggerDelay.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_TriggerDelay.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_ImuData.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_ImuData.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_ImuData.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_ImuData.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Debug/SimpleView_SGBM.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/Release/SimpleView_SGBM.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/MinSizeRel/SimpleView_SGBM.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/samples" TYPE EXECUTABLE FILES "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/bin/RelWithDebInfo/SimpleView_SGBM.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "D:/AAAAAAA/software/PERCIPIO/camport3-master/sample/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")