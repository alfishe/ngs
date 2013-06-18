@ECHO OFF

cd ..\main_rom

..\..\tools\asw\asw -U -L main_ngs.a80
..\..\tools\asw\p2bin main_ngs.p neogs.rom -r $-$ -k

cd ..\loader_ngs

..\..\tools\asw\asw -U -L loader_ngs.a80
..\..\tools\asw\p2bin loader_ngs.p loader_ngs.rom -r $-$ -k

cd ..\create_update

copy /B /Y ..\loader_ngs\loader_ngs.rom
copy /B /Y ..\main_rom\neogs.rom
addcrc loader_ngs.rom
ren crc.bin loader.crc
addcrc fpga.bin
ren crc.bin fpga.crc
addcrc neogs.rom
ren crc.bin neogs.crc

..\..\tools\asw\asw -U -L create_update.a80
..\..\tools\asw\p2bin create_update.p NGS_ROM.UPD -r $-$ -k

del loader_ngs.rom
del neogs.rom
del loader.crc
del fpga.crc
del neogs.crc
del crc.bin

pause
