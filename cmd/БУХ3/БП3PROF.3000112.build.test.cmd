SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=Åìï3
SET DESCENT=3000112
SET PLATFORM=80314
SET PREFIX=PROF

cd ../..
v8unpack.exe -B src\%SUBSYSTEM%%PREFIX% bin\%PRODUCT%_%SUBSYSTEM%_%DESCENT%.test.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
pause