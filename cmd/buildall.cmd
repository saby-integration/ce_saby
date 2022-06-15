cd ..

SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=Åìï3
SET DESCENT=3000112
SET PLATFORM=80314
SET PREFIX=ÅÉì
v8unpack.exe -B src\%SUBSYSTEM%%PREFIX% bin\%PRODUCT%_%PREFIX%_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
SET PREFIX=PROF
v8unpack.exe -B src\%SUBSYSTEM%%PREFIX% bin\%PRODUCT%_%SUBSYSTEM%_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%

SET SUBSYSTEM=áìè3
SET DESCENT=301019
SET PLATFORM=80314
SET PREFIX=BASE
v8unpack.exe -B src\%SUBSYSTEM%%PREFIX% bin\%PRODUCT%_%SUBSYSTEM%%PREFIX%_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
SET PREFIX=CORP
v8unpack.exe -B src\%SUBSYSTEM%%PREFIX% bin\%PRODUCT%_%SUBSYSTEM%%PREFIX%_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
SET PREFIX=PROF
v8unpack.exe -B src\%SUBSYSTEM%%PREFIX% bin\%PRODUCT%_%SUBSYSTEM%%PREFIX%_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
SET PREFIX=ZGU
v8unpack.exe -B src\%SUBSYSTEM%%PREFIX% bin\%PRODUCT%_%SUBSYSTEM%%PREFIX%_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
pause
