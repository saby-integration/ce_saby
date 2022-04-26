SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=áìè3BASE
SET DESCENT=301019
SET PLATFORM=80314

cd ..
v8unpack.exe -B src\%SUBSYSTEM% bin\%PRODUCT%_%SUBSYSTEM%_%DESCENT%.test.cfe --index cmd\index.json --version %PLATFORM% --descent %DESCENT%
pause