project (Application)
cmake_minimum_required( VERSION 3.7.2 )

#SET(BUILD_DIR ${CMAKE_SOURCE_DIR}/build)
#SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${BUILD_DIR}/bin)
set(CMAKE_INSTALL_PREFIX ${CMAKE_SOURCE_DIR}/build)
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

add_subdirectory(src)
