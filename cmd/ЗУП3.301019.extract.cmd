SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=áìè3
SET DESCENT=301019

cd ..
v8unpack.exe -E bin\%PRODUCT%_%SUBSYSTEM%_%DESCENT%.cfe src\%SUBSYSTEM% --index cmd\index.json --descent %DESCENT%
pause