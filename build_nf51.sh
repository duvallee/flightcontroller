if [ ! -r output ]
then
   mkdir output
else
   rm -rf ./output/*
fi

./build.sh nf51

cp ./nRF51_SDK/nf51_drone_inf/_build/nrf51422_xxac.bin ./output/.
cp ./nRF51_SDK/nf51_drone_inf/_build/nrf51422_xxac.hex ./output/.
cp ./nRF51_SDK/nf51_drone_inf/_build/nrf51422_xxac.map ./output/.
cp ./nRF51_SDK/nf51_drone_inf/_build/nrf51422_xxac.out ./output/.

