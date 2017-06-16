PROJECT (Application)
CMAKE_MINIMUM_REQUIRED( VERSION 3.7.2 )

SET(BUILD_DIR ${CMAKE_SOURCE_DIR}/build)
SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${BUILD_DIR}/bin)
SET(CMAKE_INSTALL_PREFIX ${BUILD_DIR})

#INCLUDE(ExternalProject)

#ExternalProject_Add (
#	SharedLib
#    GIT_REPOSITORY https://github.com/J0ACH/_template_SharedLib.git
#    GIT_TAG "master"
#	#SOURCE_DIR "${CMAKE_SOURCE_DIR}/externalParts/SharedLib"
#    UPDATE_COMMAND ""
#    INSTALL_COMMAND "" 
#)

#INCLUDE(cmake/AddQtModule.cmake)

ADD_SUBDIRECTORY(src)