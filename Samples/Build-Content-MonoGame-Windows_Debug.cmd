@ECHO OFF
SETLOCAL

:: Change working directory.
cd Content

:: Build content with MonoGame Content Builder tool.
..\..\Source\MonoGame\Tools\MGCB\bin\Windows\AnyCPU\Debug\MGCB.exe /@:Content-MonoGame-Windows.mgcb || GOTO error

:: ZIP content.
..\..\Tools\Pack\bin\x64\Debug\Pack.exe --output bin\MonoGame\Windows\Content.zip --recursive --directory bin\MonoGame\Windows\Content *.* || GOTO error

cd ..

ECHO.
ECHO SUCCESS - Content build successful.
PAUSE
EXIT

:error
ECHO.
ECHO ERROR - Content build failed.
PAUSE
EXIT /B 1