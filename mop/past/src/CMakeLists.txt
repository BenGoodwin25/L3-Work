cmake_minimum_required(VERSION 2.6)

                

#Déclaration du projet

project(CmakeTest)

message("CMAKE_SYSTEM_NAME: ${CMAKE_SYSTEM_NAME}")

#Déclaration de l'exécutable

add_executable(cmaketest
        cmaketest.cc
)
