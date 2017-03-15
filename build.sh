#!/bin/bash
#
#

# get cpu core number
export CPU_JOB_NUM=$(grep processor /proc/cpuinfo | awk '{field=$NF};END{print field+2}')

# setup directory name of tool-chain in the ./toolchain
# ver 4.9-2015q3
export TOOLCHAIN_DIRECTORY_NAME="gcc-arm-none-eabi-4_9-2015q3"
# ver 5.4-2016q3
# export TOOLCHAIN_DIRECTORY_NAME=gcc-arm-none-eabi-5_4-2016q3
export TOOLCHAIN_PREFIX_NAME=arm-none-eabi-

export ARCH=arm

# -----------------------------------------------------------------
export OPTION1_FC_CONTROLLER=$1
export OPTION2_TARGET=$2
export BUILD_ROOT_PATH=`pwd`

function usage()
{
    echo
    echo "./build.sh [FC_CONTROLLER] [TARGET NAME]"
    echo "   [FC_CONTROLLER] cleanflight or betaflight, nf51"
    echo "   [TARGET NAME] LUX_RACE"
    echo
}

function check_param()
{
    if [ -z $OPTION1_FC_CONTROLLER ]
    then
        usage
        exit 0
    fi
    
#    if [ -z $OPTION2_TARGET ]
#    then
#        usage
#        exit 0
#    fi
}

function build()
{
    {
        START_TIME=`date +%s`
        make clean
        make -j$CPU_JOB_NUM TARGET=$OPTION2_TARGET
        END_TIME=`date +%s`

        echo "============================================================================="
        echo "Build time : $((($END_TIME-$START_TIME)/60)) minutes $((($END_TIME-$START_TIME)%60)) seconds"
        echo "============================================================================="
    } 2>&1 |tee $BUILD_ROOT_PATH/output/${OPTION1_FC_CONTROLLER}_build.out

    if [ $? != 0 ]
    then
        echo "Build Errror !!!"
    fi
}
# 2>&1 |tee $BUILD_ROOT_PATH/output/${OPTION1_FC_CONTROLLER}_build.out

# main routine
# ----------------------------------------------
{
    clear
    check_param
    echo
    echo "Build fc controller for" $OPTION1_FC_CONTROLLER 
    echo
    # add tool-chain bin directory to PATH
    export GNU_TOOLCHAIN_ROOT_PATH="${BUILD_ROOT_PATH}/toolchain/${TOOLCHAIN_DIRECTORY_NAME}"
    export PATH=${GNU_TOOLCHAIN_ROOT_PATH}/bin:$PATH

    # check gcc compiler
    ${TOOLCHAIN_PREFIX_NAME}gcc -v

    if [ $? != 0 ]
    then
        echo
        echo
        echo "Not found tool-chain for ARM Cortex-M3 !!!"
        echo
        exit 0
    fi

    case $OPTION1_FC_CONTROLLER in
        "cleanflight")
            pushd .
            cd $OPTION1_FC_CONTROLLER
            build
            popd
            ;;
        "betaflight")
            pushd .
            cd $OPTION1_FC_CONTROLLER
            build
            popd
            ;;
        "nf51")
            pushd .
            cd ./nRF51_SDK/nf51_drone
            build
            popd
            ;;
        "nrf51_new")
            pushd .
            cd ./nRF51_SDK_v11/nrf51_drone
            build
            popd
            ;;
        *)
            echo "error"
            usage
            exit 0
            ;;
    
    esac
}
# ----------------------------------------------


