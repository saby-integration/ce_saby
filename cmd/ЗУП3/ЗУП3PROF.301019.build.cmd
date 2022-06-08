SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=áìè3
SET DESCENT=301019
SET PLATFORM=80314
SET PREFIX=PROF

cd ../..
v8unpack.exe -B src\%SUBSYSTEM%%PREFIX% bin\%PRODUCT%_%SUBSYSTEM%_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
pause
