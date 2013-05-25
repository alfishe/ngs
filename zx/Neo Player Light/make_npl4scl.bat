@ECHO OFF

..\..\tools\asw\asw -cpu z80undoc -U -L play4ngs.a80
..\..\tools\asw\p2bin play4ngs.p play4ngs.rom -r $-$ -k
rem ..\sjasmplus --sym=sym.log --lst=dump.log -isrc make_npl.a80
..\..\tools\mhmt\mhmt -mlz play4ngs.rom play4ngs_pack.rom

..\..\tools\asw\asw -cpu z80undoc -U -L play_ngs.a80
..\..\tools\asw\p2bin play_ngs.p npl.rom -r $-$ -k
rem ..\sjasmplus -isrc make_npl4rom.a80
..\..\tools\mhmt\mhmt -mlz npl.rom npl_pack.rom

..\..\tools\asw\asw -cpu z80undoc -U -L make_npl4scl.a80
..\..\tools\asw\p2bin make_npl4scl.p npl.scl -r $-$ -k
rem ..\sjasmplus -isrc make_npl2hobeta.a80

pause