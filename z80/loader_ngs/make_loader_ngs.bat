@ECHO OFF

..\..\tools\asw\asw -cpu z80undoc -U -L loader_ngs.a80
..\..\tools\asw\p2bin loader_ngs.p loader_ngs.rom -r $-$ -k

del *.lst

pause