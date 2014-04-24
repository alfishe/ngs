@ECHO OFF

cd ..\main_rom

..\..\tools\asw\asw -U -L main_ngs.a80
..\..\tools\asw\p2bin main_ngs.p neogs.rom -r $-$ -k

del *.lst

cd ..\loader_ngs

..\..\tools\asw\asw -U -L loader_ngs.a80
..\..\tools\asw\p2bin loader_ngs.p loader_ngs.rom -r $-$ -k

del *.lst

cd ..\bootFPGA00

cp ../../fpga/current/quartus/main.rbf ./

..\..\tools\mhmt\mhmt main.rbf main.mlz

call mk.bat bootFPGA

..\..\tools\addcrc\addcrc -n bootFPGA.bin bootFPGA.crc

del *.lst
del *.mlz
del *.rbf
del *.hex

cd ..\create_update

copy /B /Y ..\loader_ngs\loader_ngs.rom
copy /B /Y ..\main_rom\neogs.rom
copy /B /Y ..\bootFPGA00\bootFPGA.crc fpga.bin

..\..\tools\asw\asw -U -L make_full_rom.a80
..\..\tools\asw\p2bin make_full_rom.p full_ngs.rom -r $-$ -k

del loader_ngs.rom
del neogs.rom
del *.lst

copy /B /Y full_ngs.rom D:\UnrealSpeccy\bootgs.bin

pause