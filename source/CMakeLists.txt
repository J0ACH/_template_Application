
find_package(SharedLib 0.3.0 EXACT REQUIRED)
find_package(Qt5 COMPONENTS Widgets REQUIRED)

add_subdirectory(App)

add_executable(app
  ${app_src}
  ${app_hdr}
)

string(TOUPPER ${CMAKE_CONFIGURATION_TYPES} configType)
set_target_properties( app
    PROPERTIES
		RUNTIME_OUTPUT_DIRECTORY_${configType} ${CMAKE_BINARY_DIR}/bin
)

target_link_libraries(app PRIVATE 
	SharedLib
	Qt5::Widgets
)

add_custom_command(TARGET app
	POST_BUILD
		COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:SharedLib> ${CMAKE_BINARY_DIR}/bin
)

if(WIN32)
	if( ${CMAKE_CONFIGURATION_TYPES} STREQUAL "Release" )
		set_target_properties( app PROPERTIES WIN32_EXECUTABLE TRUE )
	endif()
endif(WIN32)

install(TARGETS app RUNTIME DESTINATION .)
install(FILES $<TARGET_FILE:SharedLib> DESTINATION .)

#include(InstallRequiredLibraries)
#InstallRequiredLibraries(.)


get_target_property(print_IMPORTED_LINK_DEPENDENT_LIBRARIES SharedLib IMPORTED_LINK_DEPENDENT_LIBRARIES) 
message(STATUS "\t print_IMPORTED_LINK_DEPENDENT_LIBRARIES: " ${print_IMPORTED_LINK_DEPENDENT_LIBRARIES})
