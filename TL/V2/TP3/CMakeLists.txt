cmake_minimum_required(VERSION 3.6)
project(TP3)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES
    fa.c
    fa.h
    graph.c
    graph.h
    list.c
    list.h
    testfa.c)

add_executable(TP3 ${SOURCE_FILES})