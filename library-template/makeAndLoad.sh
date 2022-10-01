#!/bin/bash
export LIBRARY_NAME="library-template"
export PROJECT_NAME="library-template-demo"
export ELF_LOAD_FILE=$PROJECT_NAME".elf"
export PICO_SDK_PATH="/home/seth/pico/pico-sdk"
export PICO_PROJECT_PATH="/home/seth/pico-development/pico-libraries/"$LIBRARY_NAME
export PICO_PROJECT_BUILD=$PICO_PROJECT_PATH"/build/"

cmake $PICO_PROJECT_PATH/CMakeLists.txt -B $PICO_PROJECT_BUILD
echo ==========================================================================
make -C $PICO_PROJECT_BUILD
echo ==========================================================================
openocd -f interface/picoprobe.cfg -f target/rp2040.cfg -c "program $PICO_PROJECT_BUILD${ELF_LOAD_FILE} verify reset exit"
