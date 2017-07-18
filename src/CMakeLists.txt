
find_package(SharedLib REQUIRED)
find_package(Qt5 COMPONENTS Widgets REQUIRED)

#MESSAGE(STATUS "SharedLib_INCLUDE_DIRS: " ${SharedLib_INCLUDE_DIRS})
#MESSAGE(STATUS "SharedLib_LIBRARIES: " ${SharedLib_LIBRARIES})
MESSAGE(STATUS "SharedLib_LOCATION: " ${SharedLib_LOCATION})
MESSAGE(STATUS "SharedLib_DIR: " ${SharedLib_DIR})

add_subdirectory(App)

add_executable(app
  ${app_src}
  ${app_hdr}
)

target_include_directories(app PRIVATE 
	$<TARGET_PROPERTY:SharedLib,INTERFACE_INCLUDE_DIRECTORIES>
	$<TARGET_PROPERTY:Qt5::Widgets,INTERFACE_INCLUDE_DIRECTORIES>
)

target_link_libraries(app PRIVATE 
	$<TARGET_LINKER_FILE:SharedLib> 
	$<TARGET_LINKER_FILE:Qt5::Widgets>
	$<TARGET_LINKER_FILE:Qt5::WinMain> # dulezity pro main() funkci
)

IF(WIN32)
	IF( ${CMAKE_CONFIGURATION_TYPES} STREQUAL "Release" )
		SET_TARGET_PROPERTIES( app PROPERTIES WIN32_EXECUTABLE TRUE )
	ENDIF()
ENDIF(WIN32)

#MESSAGE(STATUS "SharedLib_INSTALL_DIR: " ${SharedLib_INSTALL_DIR} )

install(TARGETS app RUNTIME DESTINATION install)
install(FILES $<TARGET_FILE:SharedLib> DESTINATION install)

INCLUDE(InstallRequiredLibraries)
InstallRequiredLibraries(install)
