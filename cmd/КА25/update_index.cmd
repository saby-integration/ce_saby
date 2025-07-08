SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=Š€25
SET DESCENT=2005010
SET PLATFORM=80317

cd ../..
v8unpack.exe -I src\%SUBSYSTEM%PROF --index cmd\%SUBSYSTEM%\index.json  --core base --descent %DESCENT%
pause