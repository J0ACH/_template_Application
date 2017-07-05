
FIND_PACKAGE(SharedLib REQUIRED)

#MESSAGE(STATUS "SharedLib_INCLUDE_DIRS: " ${SharedLib_INCLUDE_DIRS})
#MESSAGE(STATUS "SharedLib_LIBRARIES: " ${SharedLib_LIBRARIES})
MESSAGE(STATUS "SharedLib_LOCATION: " ${SharedLib_LOCATION})
MESSAGE(STATUS "SharedLib_DIR: " ${SharedLib_DIR})


#include_directories(${EXTERNAL_BUILD_LOCATION}/include)
#link_directories(${EXTERNAL_BUILD_LOCATION}/lib)

#add_executable(FirstTest main.cpp)
#dd_dependencies(FirstTest googletest)
#target_link_libraries(FirstTest gtest gtest_main pthread)

ADD_SUBDIRECTORY(App)

FIND_PACKAGE(Qt5 COMPONENTS Core REQUIRED)

ADD_EXECUTABLE(app
  ${app_src}
  ${app_hdr}
)
#add_dependencies(app SharedLib)

#ADD_DEPENDENCIES(app SharedLib)
#INCLUDE(${SharedLib_DIR}/SharedLibTargets.cmake)
#GET_TARGET_PROPERTY(SL_INCLUDE_DIRS SharedLib INTERFACE_INCLUDE_DIRECTORIES)
#MESSAGE(STATUS "SL_INCLUDE_DIRS: " ${SL_INCLUDE_DIRS})

TARGET_INCLUDE_DIRECTORIES(app PUBLIC ${SharedLib_INCLUDE_DIRS})
TARGET_LINK_LIBRARIES(app PUBLIC 
	#$<TARGET_LINKER_FILE:SharedLib> 
	SharedLib
	#Qt5::Core
	Qt5::WinMain # dulezity pro main() funkci
)

IF(WIN32)
	IF( ${CMAKE_CONFIGURATION_TYPES} STREQUAL "Release" )
		SET_TARGET_PROPERTIES( app PROPERTIES WIN32_EXECUTABLE TRUE )
	ENDIF()
ENDIF(WIN32)

#MESSAGE(STATUS "SharedLib_INSTALL_DIR: " ${SharedLib_INSTALL_DIR} )

INSTALL(TARGETS app RUNTIME DESTINATION install)

INCLUDE(InstallRequiredLibraries)
InstallRequiredLibraries(install)
INSTALL(FILES ${SharedLib_LOCATION} DESTINATION install)

#TARGET_LINK_LIBRARIES(${CMAKE_PROJECT_NAME} PUBLIC 
#	$<TARGET_LINKER_FILE:Qt5::Core> 
#	$<TARGET_LINKER_FILE:Qt5::Gui>
#	$<TARGET_LINKER_FILE:Qt5::Widgets>
#)
