# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/felix/media_system/sample_hello_world

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/felix/media_system/sample_hello_world/build_linux_dev_board

# Include any dependencies generated for this target.
include CMakeFiles/VOUT.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/VOUT.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/VOUT.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/VOUT.dir/flags.make

CMakeFiles/VOUT.dir/src/main.c.o: CMakeFiles/VOUT.dir/flags.make
CMakeFiles/VOUT.dir/src/main.c.o: ../src/main.c
CMakeFiles/VOUT.dir/src/main.c.o: CMakeFiles/VOUT.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/felix/media_system/sample_hello_world/build_linux_dev_board/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/VOUT.dir/src/main.c.o"
	/home/felix/media_system/tools/toolchain/poky/sysroots/x86_64-pokysdk-linux/usr/bin/aarch64-poky-linux/aarch64-poky-linux-gcc --sysroot=/home/felix/media_system/tools/toolchain/poky//sysroots/aarch64-poky-linux $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/VOUT.dir/src/main.c.o -MF CMakeFiles/VOUT.dir/src/main.c.o.d -o CMakeFiles/VOUT.dir/src/main.c.o -c /home/felix/media_system/sample_hello_world/src/main.c

CMakeFiles/VOUT.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/VOUT.dir/src/main.c.i"
	/home/felix/media_system/tools/toolchain/poky/sysroots/x86_64-pokysdk-linux/usr/bin/aarch64-poky-linux/aarch64-poky-linux-gcc --sysroot=/home/felix/media_system/tools/toolchain/poky//sysroots/aarch64-poky-linux $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/felix/media_system/sample_hello_world/src/main.c > CMakeFiles/VOUT.dir/src/main.c.i

CMakeFiles/VOUT.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/VOUT.dir/src/main.c.s"
	/home/felix/media_system/tools/toolchain/poky/sysroots/x86_64-pokysdk-linux/usr/bin/aarch64-poky-linux/aarch64-poky-linux-gcc --sysroot=/home/felix/media_system/tools/toolchain/poky//sysroots/aarch64-poky-linux $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/felix/media_system/sample_hello_world/src/main.c -o CMakeFiles/VOUT.dir/src/main.c.s

# Object files for target VOUT
VOUT_OBJECTS = \
"CMakeFiles/VOUT.dir/src/main.c.o"

# External object files for target VOUT
VOUT_EXTERNAL_OBJECTS =

VOUT: CMakeFiles/VOUT.dir/src/main.c.o
VOUT: CMakeFiles/VOUT.dir/build.make
VOUT: CMakeFiles/VOUT.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/felix/media_system/sample_hello_world/build_linux_dev_board/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable VOUT"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/VOUT.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/VOUT.dir/build: VOUT
.PHONY : CMakeFiles/VOUT.dir/build

CMakeFiles/VOUT.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/VOUT.dir/cmake_clean.cmake
.PHONY : CMakeFiles/VOUT.dir/clean

CMakeFiles/VOUT.dir/depend:
	cd /home/felix/media_system/sample_hello_world/build_linux_dev_board && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/felix/media_system/sample_hello_world /home/felix/media_system/sample_hello_world /home/felix/media_system/sample_hello_world/build_linux_dev_board /home/felix/media_system/sample_hello_world/build_linux_dev_board /home/felix/media_system/sample_hello_world/build_linux_dev_board/CMakeFiles/VOUT.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/VOUT.dir/depend

