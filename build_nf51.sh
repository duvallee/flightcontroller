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
./build.sh nf51

# ===============================================================================
# copy binary to output
if [ ! -r output ]
then
	echo "Build Failed !!!"
else
	cp ./nRF51_SDK/nf51_drone/_build/nrf51422_xxac_s110.bin ./output/.
	cp ./nRF51_SDK/nf51_drone/_build/nrf51422_xxac_s110.hex ./output/.
	cp ./nRF51_SDK/nf51_drone/_build/nrf51422_xxac_s110.map ./output/.
	cp ./nRF51_SDK/nf51_drone/_build/nrf51422_xxac_s110.out ./output/.
	cp ./nRF51_SDK/components/softdevice/s110/hex/s110_nrf51_8.0.0_softdevice.hex ./output/.
fi

