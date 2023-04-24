q3map2.exe -meta -v %1
q3map2.exe -vis -v %1
q3map2.exe -light -keeplights -fast -patchshadows -samples 3 -bounce 8 -gamma 2 -compensate 4 -dirty -lightmapsize 1024 -v %1
pause