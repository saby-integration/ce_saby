SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=���3
SET DESCENT=3000112
SET PLATFORM=80314

cd ../..
v8unpack.exe -B src\%SUBSYSTEM%��┨���� bin\%PRODUCT%_��┨����_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
pause