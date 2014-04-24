@ECHO OFF

..\..\tools\asw\asw -U -L main_ngs.a80
..\..\tools\asw\p2bin main_ngs.p NEOGS.ROM -r $-$ -k

..\..\tools\asw\asw -U -L main_full.a80
..\..\tools\asw\p2bin main_full.p full_ngs.rom -r $-$ -k

del *.lst

pause
