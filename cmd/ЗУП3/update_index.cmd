SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=���3
SET DESCENT=301019
SET PLATFORM=80314

cd ../..
v8unpack.exe -I src\%SUBSYSTEM%PROF --index cmd\%SUBSYSTEM%\index.json  --core base --descent %DESCENT%
pause