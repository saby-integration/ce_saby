SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=���3
SET DESCENT=3000112
SET PLATFORM=80314

cd ../..
v8unpack.exe -E bin\%PRODUCT%_��┨����_%DESCENT%.cfe src\%SUBSYSTEM%��┨���� --index cmd\%SUBSYSTEM%\index.json --descent %DESCENT%
pause