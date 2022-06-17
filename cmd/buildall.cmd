cd ..

SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=Åìï3
SET DESCENT=3000112
SET PLATFORM=80314
v8unpack.exe -B src\%SUBSYSTEM%ÅÉì bin\%PRODUCT%_%SUBSYSTEM%ÅÉì_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
v8unpack.exe -B src\%SUBSYSTEM%PROF bin\%PRODUCT%_%SUBSYSTEM%PROF_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%

SET SUBSYSTEM=áìè3
SET DESCENT=301019
v8unpack.exe -B src\%SUBSYSTEM%BASE bin\%PRODUCT%_%SUBSYSTEM%BASE_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
v8unpack.exe -B src\%SUBSYSTEM%CORP bin\%PRODUCT%_%SUBSYSTEM%CORP_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
v8unpack.exe -B src\%SUBSYSTEM%PROF bin\%PRODUCT%_%SUBSYSTEM%PROF_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
v8unpack.exe -B src\%SUBSYSTEM%áÉì bin\%PRODUCT%_%SUBSYSTEM%áÉì_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
pause
