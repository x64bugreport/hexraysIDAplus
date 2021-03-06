cls
REM @echo off
call "F:\Vs2017\IDE\VC\Auxiliary\Build\vcvarsall.bat" x64

set inputFile=src\hexraysIDAplus.cpp
set includePath=/I .\include
set target=.\bin\hexraysIDAplus.dll
set oLib=.\bin\hexRaysIDAplus.lib
set exLibPath=/LIBPATH:.\lib\x64_win_vc_32\

set marco=/D __NT__ /D __IDP__  /D DEBUG
set cflags=/Od /Zi /EHsc /std:c++latest %includePath%  /LD %marco%
set rctLib=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib ^
ws2_32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib ^
odbccp32.lib
set exLib=ida.lib network.lib

cl.exe %cflags% %inputFile%  ^
/link %rctLib% %exLib% %exLibPath% ^
/OUT:%target% /IMPLIB:%oLib%

del bin\*.ilk bin\*.exp *.obj *.pdb