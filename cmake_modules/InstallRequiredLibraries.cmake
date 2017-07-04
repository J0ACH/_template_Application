FUNCTION (InstallRequiredLibraries InstallDir)
	
	MESSAGE(STATUS "InstallRequiredLibraries macro to directory ${InstallDir} init")
	
	SET(programfilesx86 "ProgramFiles(x86)")
	SET(programfiles_DIR $ENV{${programfilesx86}})
	
	find_file (vcruntime 
		NAMES vcruntime140.dll
		PATHS 
			"${programfiles_DIR}/Microsoft Visual Studio/2017/Community/VC/Redist/MSVC/14.10.25008/x64/Microsoft.VC150.CRT"
		NO_DEFAULT_PATH
	)
	LIST(APPEND MS_DLLS ${vcruntime})
		
	find_file (msvcp 
		NAMES msvcp140.dll
		PATHS 
			"${programfiles_DIR}/Microsoft Visual Studio/2017/Community/VC/Redist/MSVC/14.10.25008/x64/Microsoft.VC150.CRT"			
		NO_DEFAULT_PATH
	)
	LIST(APPEND MS_DLLS ${msvcp})
		
	MESSAGE(STATUS "MS_DLLS: ")
	FOREACH(onePath ${MS_DLLS})
		MESSAGE(STATUS \t - ${onePath})
	ENDFOREACH(onePath)
	
	find_file (qtcore 
		NAMES Qt5Core.dll Qt5Gui.dll
		PATHS "C:/Qt/5.9.1/msvc2017_64/bin"
		#NO_DEFAULT_PATH
	)
	LIST(APPEND QT_DLLS ${qtcore})
	
	find_file (qtgui 
		NAMES Qt5Gui.dll
		PATHS "C:/Qt/5.9.1/msvc2017_64/bin"
		#NO_DEFAULT_PATH
	)
	LIST(APPEND QT_DLLS ${qtgui})
	
	find_file (qtwidgets
		NAMES Qt5Widgets.dll
		PATHS "C:/Qt/5.9.1/msvc2017_64/bin"
		#NO_DEFAULT_PATH
	)
	LIST(APPEND QT_DLLS ${qtwidgets})
	
	MESSAGE(STATUS "QT_DLLS: ")
	FOREACH(onePath ${QT_DLLS})
		MESSAGE(STATUS \t - ${onePath})
	ENDFOREACH(onePath)	

	find_file (qtwin
		NAMES qwindows.dll
		PATHS "C:/Qt/5.9.1/msvc2017_64/plugins/platforms"
		#NO_DEFAULT_PATH
	)
	LIST(APPEND QT_PLATFORMS ${qtwin})
	
	MESSAGE(STATUS "QT_PLATFORMS: ")
	FOREACH(onePath ${QT_PLATFORMS})
		MESSAGE(STATUS \t - ${onePath})
	ENDFOREACH(onePath)

	INSTALL(FILES ${MS_DLLS} DESTINATION ${InstallDir})
	INSTALL(FILES ${QT_DLLS} DESTINATION ${InstallDir})
	INSTALL(FILES ${QT_PLATFORMS} DESTINATION ${InstallDir}/platforms)

	
	MESSAGE(STATUS "Bundle macro done...\n")

ENDFUNCTION(InstallRequiredLibraries)
