PROJECT (Application)
CMAKE_MINIMUM_REQUIRED( VERSION 3.7.2 )

INCLUDE(ExternalProject)

ExternalProject_Add (
	SharedLib
    GIT_REPOSITORY https://github.com/J0ACH/_template_SharedLib.git
    GIT_TAG "master"
	#SOURCE_DIR "${CMAKE_SOURCE_DIR}/externalParts/SharedLib"
    UPDATE_COMMAND ""
    INSTALL_COMMAND "" 
)

ADD_SUBDIRECTORY(src)