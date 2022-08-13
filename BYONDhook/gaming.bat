@echo off
set byondpath=C:\Users\%username%\Documents\BYOND
set iepath=C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCache
set regpath=HKEY_CURRENT_USER\Software\Dantom\BYOND
echo.
echo.      ______ ____   _ __ __   ___ _ __   ______  ___
echo.     /  ___//    \ / '  '  \ /__// '  \ /  ___/ /  /
echo.    /  /  //  ^^  //  /  /  //  //  /  //  /  / /__/
echo.    \____//__/__//__/__/__//__//__/__/ \____/ /__/
echo.
echo.
echo Killing BYOND ^& DreamSeeker...
taskkill /f /im byond.exe /t 2>nul
taskkill /f /im dreamseeker.exe /t 2>nul
echo.
echo Deleting files...
for /f "delims=:" %%d in ('dir /b /ad "%byondpath%\cache"') do (echo %byondpath%\cache\%%d & rmdir /s /q "%byondpath%\cache\%%d")
for /f "delims=:" %%f in ('dir /b "%byondpath%\cache" ^| findstr /vil "byond.rsc"') do (echo %byondpath%\cache\%%f & del "%byondpath%\cache\%%f")
for %%z in (cfg\cauth.txt cfg\sauth.txt key.txt) do (if exist "%byondpath%\%%z" (echo %byondpath%\%%z & del "%byondpath%\%%z"))
echo.
echo Deleting registry keys...
for %%r in (sid key-info key-style) do (reg delete "%regpath%" /v %%r /f 2>nul)
echo.
echo Deleting IE cookies ^& cache...
RunDll32.exe InetCpl.cpl, ClearMyTracksByProcess 266
echo.
echo Done.
::pause