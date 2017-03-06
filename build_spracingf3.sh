if [ ! -r output ]
then
   mkdir output
else
   rm -rf ./output/*
fi

./build.sh cleanflight SPRACINGF3

cp ./cleanflight/obj/cleanflight_SPRACINGF3.hex ./output/.
cp ./cleanflight/obj/main/cleanflight_SPRACINGF3.elf ./output/.
cp ./cleanflight/obj/main/cleanflight_SPRACINGF3.map ./output/.

