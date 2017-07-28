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

message(STATUS "CMAKE_PREFIX_PATH:" $ENV{CMAKE_PREFIX_PATH})
message(STATUS "CMAKE_SYSTEM_PREFIX_PATH:" ${CMAKE_SYSTEM_PREFIX_PATH})

add_subdirectory(src)

# CPACK SETUP ###################################################

#INCLUDE(InstallRequiredSystemLibraries)

SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "My funky project")
SET(CPACK_PACKAGE_VENDOR "Me, myself, and I")
#SET(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/ReadMe.txt")
#SET(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/Copyright.txt")
SET(CPACK_PACKAGE_VERSION_MAJOR "1")
SET(CPACK_PACKAGE_VERSION_MINOR "3")
SET(CPACK_PACKAGE_VERSION_PATCH "2")
SET(CPACK_PACKAGE_INSTALL_DIRECTORY "CMake ${CMake_VERSION_MAJOR}.${CMake_VERSION_MINOR}")
IF(WIN32 AND NOT UNIX)
  # There is a bug in NSI that does not handle full unix paths properly. Make
  # sure there is at least one set of four (4) backlasshes.
  SET(CPACK_PACKAGE_ICON "${CMake_SOURCE_DIR}/Utilities/Release\\\\InstallIcon.bmp")
  SET(CPACK_NSIS_INSTALLED_ICON_NAME "bin\\\\MyExecutable.exe")
  SET(CPACK_NSIS_DISPLAY_NAME "${CPACK_PACKAGE_INSTALL_DIRECTORY} My Famous Project")
  SET(CPACK_NSIS_HELP_LINK "http:\\\\\\\\www.my-project-home-page.org")
  SET(CPACK_NSIS_URL_INFO_ABOUT "http:\\\\\\\\www.my-personal-home-page.com")
  SET(CPACK_NSIS_CONTACT "me@my-personal-home-page.com")
  SET(CPACK_NSIS_MODIFY_PATH ON)
ELSE(WIN32 AND NOT UNIX)
  SET(CPACK_STRIP_FILES "bin/MyExecutable")
  SET(CPACK_SOURCE_STRIP_FILES "")
ENDIF(WIN32 AND NOT UNIX)
SET(CPACK_PACKAGE_EXECUTABLES "MyExecutable" "My Executable")
INCLUDE(CPack)