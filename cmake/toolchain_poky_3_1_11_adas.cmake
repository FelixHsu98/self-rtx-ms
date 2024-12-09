set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

if(${CMAKE_VERSION} VERSION_GREATER 3.7.0)
	set(FLAGS_SUFIX _INIT)
else()
	set(FLAGS_SUFIX)
endif()

# SDKROOT exists then EXPORT
if(NOT "${SDKROOT}" STREQUAL "")
	set(ENV{SDKROOT} "${SDKROOT}")
# SDKROOT not exist then set SDKROOT from ENV variable
elseif(NOT "$ENV{SDKROOT}" STREQUAL "")
	set(SDKROOT "$ENV{SDKROOT}" CACHE PATH "SDKROOT location of Poky toolchain")
else()
	find_path(SDKROOT NAME version-aarch64-poky-linux
		  HINTS "${CMAKE_CURRENT_LIST_DIR}/../tools/toolchain/poky"
		  # Linux default path
		  "/opt/poky/3.1.11"
		  "/opt/poky/3.1.11/adas"
	)

	set(SDKROOT ${SDKROOT} CACHE PATH "SDKROOT location of Poky toolchain")
endif()

if(NOT EXISTS ${SDKROOT})
	message(FATAL_ERROR "Toolchain path \"SDKROOT\" is not found! Default location is
		Linux:		/opt/poky/3.1.11

		If you specified your toolchain root in another locations, please specific SDKROOT in the build_dev_sample.sh.
		CMAKE_COMMON=... -DSDKROOT=\"your toolchain location\"")
endif()

if(${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Linux")
	set(POKY_TOOLCHAIN_PATH
	    ${SDKROOT}/sysroots/x86_64-pokysdk-linux
	)
	#TODO: add support for Windows
else()
	MESSAGE(FATAL_ERROR "Unsupport HOST SYSTEM")
endif()

set(TOOLCHAIN_PATH ${POKY_TOOLCHAIN_PATH}/usr/bin/aarch64-poky-linux)

find_program(CMAKE_C_COMPILER	NAMES	"aarch64-poky-linux-gcc"	PATHS	${TOOLCHAIN_PATH})
find_program(CMAKE_RANLIB	NAMES	"aarch64-poky-linux-ranlib"	PATHS	${TOOLCHAIN_PATH})
find_program(CMAKE_CXX_COMPILER	NAMES	"aarch64-poky-linux-g++"	PATHS	${TOOLCHAIN_PATH})
find_program(CMAKE_AR		NAMES	"aarch64-poky-linux-ar"		PATHS	${TOOLCHAIN_PATH})
find_program(CMAKE_ASM_COMPILER	NAMES	"aarch64-poky-linux-gcc"	PATHS	${TOOLCHAIN_PATH})
find_program(CMAKE_AS		NAMES	"aarch64-poky-linux-as"		PATHS	${TOOLCHAIN_PATH})
find_program(CMAKE_LD		NAMES	"aarch64-poky-linux-ld"		PATHS	${TOOLCHAIN_PATH})
find_program(CMAKE_NM		NAMES	"aarch64-poky-linux-nm"		PATHS	${TOOLCHAIN_PATH})
find_program(CMAKE_GDB		NAMES	"aarch64-poky-linux-gdb"	PATHS	${TOOLCHAIN_PATH})
find_program(CMAKE_STRIP	NAMES	"aarch64-poky-linux-strip"	PATHS	${TOOLCHAIN_PATH})
find_program(CMAKE_OBJCOPY	NAMES	"aarch64-poky-linux-objcopy"	PATHS	${TOOLCHAIN_PATH})
find_program(CMAKE_OBJDUMP	NAMES	"aarch64-poky-linux-objdump"	PATHS	${TOOLCHAIN_PATH})

if(NOT CMAKE_C_COMPILER)
	message(FATAL_ERROR "CMAKE_C_COMPILER is not found")
endif()

if(NOT CMAKE_CXX_COMPILER)
	message(FATAL_ERROR "CMAKE_CXX_COMPILER is not found")
endif()

if(NOT CMAKE_ASM_COMPILER)
	message(FATAL_ERROR "CMAKE_ASM_COMPILER is not found")
endif()

if(NOT CMAKE_AR)
	message(FATAL_ERROR "CMAKE_AR is not found")
endif()

# Version of GCC required for the poky toolchain
# gcc recipe is in <yocto-folder>/poky/meta/recipes-devtools/gcc
set(REQUIRED_GCC_VERSION 9.3.0)
file(GLOB GCC_C_INCLUDE_DIR ${POKY_TOOLCHAIN_PATH}/usr/bin/aarch64-poky-linux/gcc/*/include)
if(NOT ${GCC_C_INCLUDE_DIR} MATCHES ".*(${REQUIRED_GCC_VERSION}).*")
	message(FATAL_ERROR "GCC version mismatch. Required version: ${REQUIRED_GCC_VERSION}")
endif()

#Toolchain flags configuration
set(CMAKE_SYSROOT		${SDKROOT}/sysroots/aarch64-poky-linux)
set(CMAKE_FIND_ROOT_PATH	${CMAKE_SYSROOT})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM	NEVER)
set(TRIPLE aarch64-poky-linux)

# ASSEMBLER config
set(CMAKE_ASM_FLAGS${FLAGS_SUFFIX} "--sysroot=${CMAKE_SYSROOT}")

# C COMPILER config
set(CMAKE_C_COMPILER_TARGET ${TRIPLE})
set(CMAKE_C_FLAGS${FLAGS_SUFFIX} "--sysroot=${CMAKE_SYSROOT}")

# C++ COMPILER config
set(CMAKE_CXX_COMPILER_TARGET ${TRIPLE})
set(CMAKE_CXX_FLAGS${FLAGS_SUFFIX} "--sysroot=${CMAKE_SYSROOT}")

# Linker
set(CMAKE_EXE_LINKER_FLAGS${FLAGS_SUFFIX} "-Wl,-gc-sections")
