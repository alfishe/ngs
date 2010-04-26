@ECHO OFF

..\..\tools\sjasmplus\sjasmplus -isrc make_rom.a80

rem ..\..\tools\sjasmplus\sjasmplus --sym=sym.log --lst=dump.log -isrc make_rom.a80

if %errorlevel% neq 0 goto end

	copy /b gsroml+gsromh gs105a.rom >nul
	del gsroml
	del gsromh

pause
