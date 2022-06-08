SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=áìè3
SET DESCENT=301019
SET PLATFORM=80314
SET PREFIX=PROF

cd ../..
v8unpack.exe -E bin\%PRODUCT%_%SUBSYSTEM%_%DESCENT%.cfe src\%SUBSYSTEM%%PREFIX% --index cmd\%SUBSYSTEM%\index.json --descent %DESCENT%
pause