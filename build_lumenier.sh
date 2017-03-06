if [ ! -r output ]
then
   mkdir output
else
   rm -rf ./output/*
fi


./build.sh cleanflight LUX_RACE

cp ./cleanflight/obj/cleanflight_LUX_RACE.hex ./output/.
cp ./cleanflight/obj/main/cleanflight_LUX_RACE.elf ./output/.
cp ./cleanflight/obj/main/cleanflight_LUX_RACE.map ./output/.

