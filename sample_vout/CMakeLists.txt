set(app_name "Hello_World")

cmake_minimum_required(VERSION 3.16.3)

project(${app_name})

message("============================ Debug Message ============================")
message(STATUS "CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}")
message(STATUS "CMAKE_ROOT = ${CMAKE_ROOT}")
message(STATUS "CMAKE_CURRENT_LIST_DIR = ${CMAKE_CURRENT_LIST_DIR}")
message(STATUS "CMAKE_FIND_PACKAGE_REDIRECTS_DIR = ${CMAKE_FIND_PACKAGE_REDIRECTS_DIR}")
message(STATUS "CMAKE_SYSTEM_PROCESSOR = ${CMAKE_SYSTEM_PROCESSOR}")
message(STATUS "CMAKE_C_COMPILER_ID = ${CMAKE_C_COMPILER_ID}")
message(STATUS "CMAKE_SYSTEM_NAME = ${CMAKE_SYSTEM_NAME}")
message(STATUS "CMAKE_SOURCE_DIR = ${CMAKE_SOURCE_DIR}")

option(INC_RTXMS "option for adding rtx-ms package" OFF)
if (INC_RTXMS)
	message(STATUS "INC-RTXMS = ${INC_RTXMS}: using rtx-ms package")
	find_package(rtx-ms REQUIRED)
else ()
	message(STATUS "INC-RTXMS = ${INC_RTXMS}: not using rtx-ms package")
endif()
message("=======================================================================")

set(source ${CMAKE_CURRENT_SOURCE_DIR}/src/main.c)

set(header)

set(include_dir)

add_executable(${app_name})
target_sources(${app_name} PRIVATE
	"$<BUILD_INTERFACE:${source};${header}>")



