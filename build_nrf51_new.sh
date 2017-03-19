#!/bin/bash
#
#

# ===============================================================================
# clear output directory
if [ ! -r output ]
then
   mkdir output
else
   rm -rf ./output/*
fi

# ===============================================================================
# build
./build.sh nrf51_new

# ===============================================================================
# copy binary to output
if [ ! -r output ]
then
	echo "Build Failed !!!"
else
	cp ./nRF51_SDK_v11/nrf51_uart_central/_build/nrf51_uart_central.* ./output/.
	cp ./nRF51_SDK_v11/nrf51_uart_peripheral/_build/nrf51_uart_peripheral.* ./output/.
	cp ./nRF51_SDK_v11/components/softdevice/s130/hex/s130_nrf51_2.0.0_softdevice.hex ./output/.
fi
