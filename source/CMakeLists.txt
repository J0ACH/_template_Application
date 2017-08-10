
find_package(SharedLib 0.2.0 REQUIRED)

#MESSAGE(STATUS "SharedLib_INCLUDE_DIRS: " ${SharedLib_INCLUDE_DIRS})
#MESSAGE(STATUS "SharedLib_LIBRARIES: " ${SharedLib_LIBRARIES})
#MESSAGE(STATUS "SharedLib_LOCATION: " ${SharedLib_LOCATION})
MESSAGE(STATUS "SharedLib_DIR: " ${SharedLib_DIR})

add_subdirectory(App)

add_executable(app
  ${app_src}
  ${app_hdr}
)

string(TOUPPER ${CMAKE_CONFIGURATION_TYPES} configType)
set_target_properties( app
    PROPERTIES
		RUNTIME_OUTPUT_DIRECTORY_${configType} ${buildDir}/bin
)

target_link_libraries(app PRIVATE 
	SharedLib
)

if(WIN32)
	if( ${CMAKE_CONFIGURATION_TYPES} STREQUAL "Release" )
		set_target_properties( app PROPERTIES WIN32_EXECUTABLE TRUE )
	endif()
endif(WIN32)

install(TARGETS app RUNTIME DESTINATION .)
install(FILES $<TARGET_FILE:SharedLib> DESTINATION .)

include(InstallRequiredLibraries)
InstallRequiredLibraries(.)
