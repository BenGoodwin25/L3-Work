cmake_minimum_required(VERSION 3.6)
project(TP7_8)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES
    fa.c
    fa.h
    graph.c
    graph.h
    list.c
    list.h
    testfa.c)

add_executable(TP7_8 ${SOURCE_FILES})