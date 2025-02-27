@echo off

REM set msvc env
cd /d "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build"
vcvarsall.bat x64

REM set env path
set path=%path%;%~dp0..\package\Qt_Static-6.6.0\bin
set path=%path%;%~dp0..\package\Jom;

REM qmake
cd /d "%~dp0..\build_output"
qmake ..\installerfw.pro -spec win32-msvc "CONFIG+=qtquickcompiler"  -o %~dp0\..\build_output

REM jom
jom.exe qmake_all
jom.exe -j4 -f Makefile