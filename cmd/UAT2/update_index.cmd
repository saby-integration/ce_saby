SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=UAT22
SET DESCENT=2022401
SET PLATFORM=80316

cd ../..
v8unpack.exe -I src\%SUBSYSTEM%PROF --index cmd\%SUBSYSTEM%\index.json  --core base --descent %DESCENT%
pause