cd ..

SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=???3
SET DESCENT=3000112
SET PLATFORM=80314
v8unpack.exe -B src\%SUBSYSTEM%??┨???? bin\%PRODUCT%_??┨????_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
v8unpack.exe -B src\%SUBSYSTEM%PROF bin\%PRODUCT%_%SUBSYSTEM%PROF_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%

SET SUBSYSTEM=???3
SET DESCENT=301019
v8unpack.exe -B src\%SUBSYSTEM%BASE bin\%PRODUCT%_%SUBSYSTEM%BASE_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
v8unpack.exe -B src\%SUBSYSTEM%CORP bin\%PRODUCT%_%SUBSYSTEM%CORP_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
v8unpack.exe -B src\%SUBSYSTEM%PROF bin\%PRODUCT%_%SUBSYSTEM%PROF_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%
v8unpack.exe -B src\%SUBSYSTEM%????3 bin\%PRODUCT%_????3_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%

SET SUBSYSTEM=ERP25
SET DESCENT=2005006
v8unpack.exe -B src\%SUBSYSTEM%PROF bin\%PRODUCT%_%SUBSYSTEM%PROF_%DESCENT%.cfe --index cmd\%SUBSYSTEM%\index.json --version %PLATFORM% --descent %DESCENT%

pause
