#!/bin/bash

SDK_ROOT="${PWD}"
CMAKE_COMMON="-DCMAKE_BUILD_TYPE=debug -DCMAKE_EXPORT_COMPILE_COMMANDS=on -DSDKROOT=${PWD}/tools/toolchain/poky/"
#CMAKE_COMMON="-DCMAKE_BUILD_TYPE=debug -DCMAKE_EXPORT_COMPILE_COMMANDS=on"

cd sample_hello_world
echo "create build folder \"build_linux_dev_board\""
rm -rf build_linux_dev_board
mkdir build_linux_dev_board
cd build_linux_dev_board


TOOLCHAIN="toolchain_poky_3_1_11_adas"

cmake .. -G "Unix Makefiles" $CMAKE_COMMON -DCMAKE_TOOLCHAIN_FILE=${SDK_ROOT}/cmake/${TOOLCHAIN}.cmake

echo "========================== Start building =============================="
cmake --build .
