SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=Åìï3
SET DESCENT=3000112
SET PLATFORM=80314

cd ../..
v8unpack.exe -E bin\%PRODUCT%_ÅÉì_%DESCENT%.cfe src\%SUBSYSTEM%ÅÉì --index cmd\%SUBSYSTEM%\index.json --descent %DESCENT%
pause