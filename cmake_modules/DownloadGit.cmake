FUNCTION (DownloadGit)

	MESSAGE(STATUS "")	
	MESSAGE(STATUS "DownloadGit macro init")

	SET(oneValueArgs PROJECT GIT_REPOSITORY SOURCE_DIR)
	SET(multiValueArgs GIT_FOLDERS)
	SET(options VERBATIM)

    CMAKE_PARSE_ARGUMENTS( DownloadGit "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

	MESSAGE(STATUS "DownloadGit_PROJECT: " ${DownloadGit_PROJECT})
	MESSAGE(STATUS "DownloadGit_GIT_REPOSITORY: " ${DownloadGit_GIT_REPOSITORY})
	
	MESSAGE(STATUS "DownloadGit_GIT_FOLDERS: ")
	FOREACH(oneVar ${DownloadGit_GIT_FOLDERS})
	 	MESSAGE(STATUS "\t - " ${oneVar})
	ENDFOREACH(oneVar)

	MESSAGE(STATUS "DownloadGit_SOURCE_DIR: " ${DownloadGit_SOURCE_DIR})

	MESSAGE(STATUS "DownloadGit_VERBATIM: " ${DownloadGit_VERBATIM})
	
	SET(GIT_DIR ${DownloadGit_SOURCE_DIR}/src/.git)
	IF(NOT EXISTS ${GIT_DIR})
		MESSAGE(STATUS "GIT_DIR non_exist")		
		FILE(MAKE_DIRECTORY ${DownloadGit_SOURCE_DIR})
		EXECUTE_PROCESS (
			COMMAND git clone -- ${DownloadGit_GIT_REPOSITORY} ${DownloadGit_SOURCE_DIR}
			RESULT_VARIABLE Result
			ERROR_VARIABLE  ERR
			#OUTPUT_QUIET
			#WORKING_DIRECTORY ${DownloadGit_SOURCE_DIR}
		)
	ELSE()
		MESSAGE(STATUS "GIT_DIR exist")

		EXECUTE_PROCESS (
		#COMMAND git clone -- ${DownloadGit_GIT_REPOSITORY} ${DownloadGit_SOURCE_DIR}
		#COMMAND cd ${DownloadGit_SOURCE_DIR}
		#COMMAND	git init ${DownloadGit_SOURCE_DIR}
		#COMMAND	git init ${DownloadGit_GIT_REPOSITORY} 
		#COMMAND git remote add origin ${DownloadGit_GIT_REPOSITORY} 
		COMMAND git remote -v
			#COMMAND git remote add -m master -f --no-tags SharedLib ${DownloadGit_GIT_REPOSITORY}
			#COMMAND git remote pull origin
			#COMMAND git fetch origin 
		#COMMAND git remote add --fetch origin ${DownloadGit_GIT_REPOSITORY}
		#COMMAND git remote add --fetch origin ${DownloadGit_GIT_REPOSITORY}
		#COMMAND git remote add -f origin ${DownloadGit_GIT_REPOSITORY}
		#COMMAND git config core.sparseCheckout true
		#COMMAND echo "src//" >> .git/info/sparse-checkout
		#COMMAND git pull origin master
		RESULT_VARIABLE Result
		ERROR_VARIABLE  ERR
		#OUTPUT_QUIET
		WORKING_DIRECTORY ${DownloadGit_SOURCE_DIR}
	)

	ENDIF(NOT EXISTS ${GIT_DIR})

	#FILE(REMOVE ${DownloadGit_SOURCE_DIR})
	
	

	#[[
	EXECUTE_PROCESS (
		#COMMAND git clone -- ${DownloadGit_GIT_REPOSITORY} ${DownloadGit_SOURCE_DIR}
		#COMMAND cd ${DownloadGit_SOURCE_DIR}
		COMMAND	git init ${DownloadGit_SOURCE_DIR}
		#COMMAND git remote add origin ${DownloadGit_GIT_REPOSITORY} 
		COMMAND git pull origin ${DownloadGit_GIT_REPOSITORY} 
		#COMMAND git remote add --fetch origin ${DownloadGit_GIT_REPOSITORY}
		#COMMAND git remote add --fetch origin ${DownloadGit_GIT_REPOSITORY}
		#COMMAND git remote add -f origin ${DownloadGit_GIT_REPOSITORY}
		#COMMAND git config core.sparseCheckout true
		#COMMAND echo "src//" >> .git/info/sparse-checkout
		#COMMAND git pull origin master
		RESULT_VARIABLE Result
		ERROR_VARIABLE  ERR
		OUTPUT_QUIET
		#WORKING_DIRECTORY ${DownloadGit_SOURCE_DIR}
	)
	#]]
	MESSAGE(STATUS "Result: " ${Result})
	MESSAGE(STATUS "ERR: " ${ERR})
	
	ADD_SUBDIRECTORY(${DownloadGit_SOURCE_DIR}/src)

	MESSAGE(STATUS "DownloadGit macro done...\n")
	

ENDFUNCTION (DownloadGit)