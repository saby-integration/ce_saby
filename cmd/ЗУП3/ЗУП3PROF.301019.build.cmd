SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=???3
SET DESCENT=301019
SET PLATFORM=80314

cd ../..
v8unpack.exe -B src\%SUBSYSTEM%PROF bin\%PRODUCT%_%SUBSYSTEM%PROF_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
pause
