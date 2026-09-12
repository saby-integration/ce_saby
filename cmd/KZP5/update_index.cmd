SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=KZP5
SET DESCENT=5000095
SET PLATFORM=80321

cd ../..
v8unpack.exe -I src\%SUBSYSTEM%PROF --index cmd\%SUBSYSTEM%\index.json  --core base --descent %DESCENT%
pause