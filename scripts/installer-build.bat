@echo on
SetLocal EnableDelayedExpansion
REM set msvc env
CALL "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" x64

REM set env path
set path=%path%;%~dp0..\package\Qt_Static-6.6.0\bin
set path=%path%;%~dp0..\package\Jom;

REM qmake
%~dp0..\package\Qt_Static-6.6.0\bin\qmake.exe .\installerfw.pro -spec win32-msvc "CONFIG+=qtquickcompiler"  -o %~dp0..\build_output

REM jom
cd build_output
%~dp0..\package\Jom\jom.exe qmake_all
%~dp0..\package\Jom\jom.exe -j4 -f Makefile
EndLocal