SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=UT11
SET DESCENT=1100414
SET PLATFORM=80316

cd ../..
v8unpack.exe -I src\%SUBSYSTEM%PROF --index cmd\%SUBSYSTEM%\index.json  --core base --descent %DESCENT%
pause