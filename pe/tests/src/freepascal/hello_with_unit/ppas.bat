@echo off
SET THEFILE=C:\Users\Alecu\Desktop\learning\pe\tests\src\freepascal\hello_with_unit\fpc_hello_with_unit.exe
echo Linking %THEFILE%
C:\fpcupdeluxe\fpc\bin\x86_64-win64\ld.exe -b pei-x86-64  --gc-sections  -s  --entry=_mainCRTStartup    -o C:\Users\Alecu\Desktop\learning\pe\tests\src\freepascal\hello_with_unit\fpc_hello_with_unit.exe C:\Users\Alecu\Desktop\learning\pe\tests\src\freepascal\hello_with_unit\link20808.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
