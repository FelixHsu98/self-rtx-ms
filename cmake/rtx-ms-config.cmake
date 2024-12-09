if (CMAKE_VERSION VERSION_LESS 3.16.3)
	message(FATAL_ERROR "rtx-ms requires ata least CMake version 3.16.3")
endif()

if (NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE RELEASE CACHE STRING "Build type" FORCE)
else()
	string(TOUPPER ${CMAKE_BUILD_TYPE} CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE ${CMAKE_BUILD_TYPE} CACHE STRING "Build type" FORCE)
endif()

string(TOLOWER ${CMAKE_SYSTEM_PROCESSOR} processor)
string(TOLOWER ${CMAKE_C_COMPILER_ID} compiler)
string(TOLOWER ${CMAKE_SYSTEM_NAME} system)

set(export_set "rtx-ms-${processor}-${compiler}-${system}")

find_package(${export_set}
	     PATH "${CMAKE_CURRENT_LIST_DIR}" "${CMAKE_SOURCE_DIR}/cmake"
	     NO_DEFAULT_PATH)

# TODO: set NOT_FOUND message if package is not found
