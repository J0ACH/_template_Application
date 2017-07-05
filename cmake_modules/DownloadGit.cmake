FUNCTION (DownloadGit)

	MESSAGE(STATUS "")	
	MESSAGE(STATUS "DownloadGit macro init")

	SET(oneValueArgs GIT_REPOSITORY)
	SET(multiValueArgs GIT_FOLDERS)
	SET(options VERBATIM)

    CMAKE_PARSE_ARGUMENTS( DownloadGit "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

	MESSAGE(STATUS "DownloadGit_GIT_REPOSITORY: " ${DownloadGit_GIT_REPOSITORY})
	
	MESSAGE(STATUS "DownloadGit_GIT_FOLDERS: ")
	FOREACH(oneVar ${DownloadGit_GIT_FOLDERS})
	 	MESSAGE(STATUS "\t - " ${oneVar})
	ENDFOREACH(oneVar)

	MESSAGE(STATUS "DownloadGit_VERBATIM: " ${DownloadGit_VERBATIM})

	MESSAGE(STATUS "DownloadGit macro done...\n")
	

ENDFUNCTION (DownloadGit)