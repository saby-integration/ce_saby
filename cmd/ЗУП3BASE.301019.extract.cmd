SET PRODUCT=ëÅàë
SET SUBSYSTEM=áìè3BASE
SET DESCENT=301019

cd ..
v8unpack.exe -E bin\%PRODUCT%.%SUBSYSTEM%.%DESCENT%.cfe src\%SUBSYSTEM% --index cmd\index.json --descent %DESCENT%
pause