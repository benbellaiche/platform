@ECHO OFF

rem Build the p8 platform library for Windows

SETLOCAL

SET MYDIR=%~dp0
SET PROJECTTYPE=nmake
SET BUILDTYPE=Release
SET VSVERSION=16
SET INSTALLPATH=%MYDIR%..\build

if exist "%MYDIR%..\build" rmdir "%MYDIR%..\build" /s /q

for %%T in (x64) do (
  call "%MYDIR%\build-lib.cmd" %PROJECTTYPE% %%T %BUILDTYPE% %VSVERSION% "%INSTALLPATH%"
)

IF %PROJECTTYPE% == nmake (
  if exist "%MYDIR%..\build\cmake" rmdir "%MYDIR%..\build\cmake" /s /q
)

