
#include(BundleUtilities)
#SET(SharedLib_DIR )
FIND_PACKAGE(SharedLib REQUIRED)

#MESSAGE(STATUS "SharedLib_INCLUDE_DIRS: " ${SharedLib_INCLUDE_DIRS})
#MESSAGE(STATUS "SharedLib_LIBRARIES: " ${SharedLib_LIBRARIES})
#MESSAGE(STATUS "SharedLib_DLL: " ${SharedLib_DLL})
#MESSAGE(STATUS "SharedLib_DIR: " ${SharedLib_DIR})

#file( COPY ${SharedLib_DLL} DESTINATION ${BUILD_DIR} )
#configure_file(${SharedLib_DLL} ${BUILD_DIR} COPYONLY)

ADD_SUBDIRECTORY(App)

ADD_EXECUTABLE(app 
  ${app_src}
  ${app_hdr}
)

#QT_ADDMODULE(app Core)

TARGET_LINK_LIBRARIES(app PUBLIC SharedLib)
#TARGET_LINK_LIBRARIES(app PUBLIC SharedLib_LIBRARIES)
#TARGET_INCLUDE_DIRECTORIES(app PUBLIC ${SharedLib_INCLUDE_DIRS})
#TARGET_INCLUDE_DIRECTORIES(app PUBLIC ${SharedLib_DLL})

#file( COPY ${SharedLib_DLL} DESTINATION "${BUILD_DIR}" NO_SOURCE_PERMISSIONS )

#add_custom_command(TARGET MyTarget PRE_BUILD
#                   COMMAND ${CMAKE_COMMAND} -E copy_directory
#                       ${CMAKE_SOURCE_DIR}/config $<TARGET_FILE_DIR:MyTarget>)

#add_custom_command(
#  OUTPUT ${BUILD_DIR} ${SharedLib_DLL}
#  COMMAND ${CMAKE_COMMAND} -E copy
#)

#add_custom_command(TARGET app POST_BUILD
    #COMMAND -E copy_directory
#	COMMAND copy ${SharedLib_DLL} DESTINATION ${BUILD_DIR}
#)

#add_custom_command(
#        TARGET app PRE_LINK
#        COMMAND ${CMAKE_COMMAND} copy
#                ${SharedLib_DLL}
#                ${BUILD_DIR})


#FIXUP_BUNDLE(app SharedLib "C:/GitHub/_template_SharedLib/build/bin/Release/")
#FIXUP_BUNDLE(app SharedLib ${SharedLib_INCLUDE_DIRS})
#FIXUP_BUNDLE(app ${SharedLib_DLL} ${SharedLib_INCLUDE_DIRS})

INSTALL(TARGETS app RUNTIME DESTINATION bin)
INSTALL(FILES ${SharedLib_LOCATION} DESTINATION bin)