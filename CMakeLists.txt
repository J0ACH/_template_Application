PROJECT (Application)
CMAKE_MINIMUM_REQUIRED( VERSION 3.7.2 )

SET(BUILD_DIR ${CMAKE_SOURCE_DIR}/build)
SET(EXTERNAL_BUILD_LOCATION ${BUILD_DIR}/external_libraries/SharedLib)
SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${BUILD_DIR}/bin)
SET(CMAKE_INSTALL_PREFIX ${BUILD_DIR})
SET(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake_modules)
SET(CMAKE_AUTOMOC ON)

#INCLUDE(ExternalProject)
#ExternalProject_Add ( SharedLib
#    GIT_REPOSITORY https://github.com/J0ACH/_template_SharedLib.git
#    GIT_TAG "master"
#	SOURCE_DIR "${CMAKE_BINARY_DIR}/SharedLib-src"
#	BINARY_DIR "${CMAKE_BINARY_DIR}/SharedLib-build"
#    UPDATE_COMMAND ""
#	CMAKE_GENERATOR "Visual Studio 15 2017 Win64"
	
#	#DOWNLOAD_DIR
#	#INSTALL_DIR ${BUILD_DIR}
#   #INSTALL_COMMAND ${SharedLib_inst_comm} 
#	#INSTALL_DIR ${BUILD_DIR}/install
#  	CMAKE_ARGS
#		"-DCMAKE_CONFIGURATION_TYPES=${CMAKE_CONFIGURATION_TYPES}"
#		"-DBUILD_DIR=${EXTERNAL_BUILD_LOCATION}"
#		"-DCMAKE_INSTALL_PREFIX=${BUILD_DIR}"
#)
#configure_file(CMakeLists.txt.in googletest-download/CMakeLists.txt)
#execute_process(COMMAND "${CMAKE_COMMAND}" -G "${CMAKE_GENERATOR}" .
#  WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/googletest-download" )
#execute_process(COMMAND "${CMAKE_COMMAND}" --build .
#  WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/googletest-download" )

INCLUDE(DownloadGit)
DownloadGit (
	GIT_REPOSITORY "aaa"
	GIT_FOLDERS "bbb" "ccc"
)

ADD_SUBDIRECTORY(src)
