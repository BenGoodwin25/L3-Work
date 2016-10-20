cmake_minimum_required(VERSION 3.6)
project(V2)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES
    fa.c
    fa.h
    fatest.c
    makefile)

add_executable(V2 ${SOURCE_FILES})