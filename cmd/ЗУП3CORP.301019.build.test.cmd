SET PRODUCT=ëÅàë
SET SUBSYSTEM=áìè3CORP
SET DESCENT=301019
SET PLATFORM=80314

cd ..
v8unpack.exe -B src\%SUBSYSTEM% bin\%PRODUCT%.%SUBSYSTEM%.%DESCENT%.test.cfe --index cmd\index.json --version %PLATFORM% --descent %DESCENT%
pause