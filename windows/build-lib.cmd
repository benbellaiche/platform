@ECHO OFF

rem Build the p8 platform library for Windows

SETLOCAL

SET MYDIR=%~dp0
SET PROJECTTYPE=%1
SET BUILDARCH=%2
SET BUILDTYPE=%3
SET VSVERSION=%4
SET INSTALLPATH=%~5

SET BUILDTARGET=%INSTALLPATH%\cmake\%BUILDARCH%
SET TARGET=%INSTALLPATH%\%BUILDARCH%

IF [%5] == [] GOTO missingparams

call "%MYDIR%..\support\windows\cmake\generate.cmd" %BUILDARCH% %PROJECTTYPE% "%MYDIR%.." "%BUILDTARGET%" "%TARGET%" %BUILDTYPE% %VSVERSION% static

IF %PROJECTTYPE% == nmake (
    call "%MYDIR%..\support\windows\cmake\build.cmd" %BUILDARCH% "%BUILDTARGET%" %VSVERSION%
)

goto exit

:missingparams
echo "build-lib.cmd requires 5 parameters"

:exit