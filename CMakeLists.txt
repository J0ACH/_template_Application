cmake_minimum_required( VERSION 3.8 )
cmake_policy(SET CMP0048 NEW)
project (Application VERSION 0.0.1)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake_modules)
set(CMAKE_AUTOMOC ON)


#[[
SET(EXTERNAL_BUILD_LOCATION ${BUILD_DIR}/external_libraries/SharedLib)

INCLUDE(DownloadGit)
DownloadGit (
	PROJECT SharedLib
	GIT_REPOSITORY https://github.com/J0ACH/_template_SharedLib.git
	GIT_FOLDERS "bbb" "ccc"
	SOURCE_DIR ${BUILD_DIR}/external_libraries/SharedLib
)
#]]

#message(STATUS "CMAKE_PREFIX_PATH:" $ENV{CMAKE_PREFIX_PATH})
#message(STATUS "CMAKE_SYSTEM_PREFIX_PATH:" ${CMAKE_SYSTEM_PREFIX_PATH})

add_subdirectory(source)

# CPACK SETUP ###################################################

if(WIN32)
	#set(CPACK_GENERATOR NSIS)
	set(CPACK_GENERATOR WIX)
	set(CPACK_PACKAGE_NAME ${CMAKE_PROJECT_NAME})
	set(CPACK_PACKAGE_VERSION ${PROJECT_VERSION})

	set(CPACK_PACKAGE_INSTALL_DIRECTORY "MyApp")
	set(CPACK_WIX_UPGRADE_GUID "690F8410-32C5-49C0-A8E4-94F57EB1100E")
	
	set(CPACK_PACKAGE_VENDOR "CMake.org")
	set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "MyLib - CPack Component Installation Example")
	
	set(CPACK_NSIS_MODIFY_PATH ON)
endif()
include(CPack)
