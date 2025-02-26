@echo off
c:
cd C:/Program Files (x86)/Microsoft Visual Studio/2019/Enterprise/BuildTools/VC/Auxiliary/Build
vcvarsall.bat x64 
set path=%path%;$GITHUB_WORKSPACE/package/Qt_Static-6.6.0/bin
cd $GITHUB_WORKSPACE
qmake -v
qmake ./installerfw.pro -spec win32-msvc "CONFIG+=qtquickcompiler"  -o ./build_output
