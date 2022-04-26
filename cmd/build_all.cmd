cd ..

SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=áìè3
SET DESCENT=301019
SET PLATFORM=80314
v8unpack.exe -B src\%SUBSYSTEM% bin\%PRODUCT%_%SUBSYSTEM%_%DESCENT%.cfe --index cmd\index.json --version %PLATFORM% --descent %DESCENT%

SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=áìè3BASE
SET DESCENT=301019
SET PLATFORM=80314
v8unpack.exe -B src\%SUBSYSTEM% bin\%PRODUCT%_%SUBSYSTEM%_%DESCENT%.cfe --index cmd\index.json --version %PLATFORM% --descent %DESCENT%

SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=áìè3CORP
SET DESCENT=301019
SET PLATFORM=80314
v8unpack.exe -B src\%SUBSYSTEM% bin\%PRODUCT%_%SUBSYSTEM%_%DESCENT%.cfe --index cmd\index.json --version %PLATFORM% --descent %DESCENT%
