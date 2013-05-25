@ECHO OFF

..\..\tools\asw\asw -cpu z80undoc -U -L play4ngs.a80
..\..\tools\asw\p2bin play4ngs.p play4ngs.rom -r $-$ -k
REM ..\sjasmplus --sym=sym.log --lst=dump.log -isrc make_play4ngs.a80
..\..\tools\mhmt\mhmt -mlz play4ngs.rom play4ngs_pack.rom

..\..\tools\asw\asw -cpu z80undoc -U -L play_ngs.a80
..\..\tools\asw\p2bin play_ngs.p npl.rom -r $-$ -k
REM ..\sjasmplus --sym=sym.log --lst=dump.log -isrc make_npl.a80
..\..\tools\mhmt\mhmt -mlz npl.rom npl_pack.rom

pause