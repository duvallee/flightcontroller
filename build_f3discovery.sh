if [ ! -r output ]
then
   mkdir output
else
   rm -rf ./output/*
fi

./build.sh cleanflight STM32F3DISCOVERY

cp ./cleanflight/obj/cleanflight_STM32F3DISCOVERY.hex ./output/.
cp ./cleanflight/obj/main/cleanflight_STM32F3DISCOVERY.elf ./output/.
cp ./cleanflight/obj/main/cleanflight_STM32F3DISCOVERY.map ./output/.

