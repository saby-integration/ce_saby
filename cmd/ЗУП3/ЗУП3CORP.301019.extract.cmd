SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=???3
SET DESCENT=301019
SET PLATFORM=80314

cd ../..
v8unpack.exe -E bin\%PRODUCT%_%SUBSYSTEM%CORP_%DESCENT%.cfe src\%SUBSYSTEM%CORP --index cmd\%SUBSYSTEM%\index.json --descent %DESCENT%
pause