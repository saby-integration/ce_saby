SET PRODUCT=saby_ce_kedo
SET SUBSYSTEM=Åìï3
SET DESCENT=3000112
SET PLATFORM=80314
SET PREFIX=ÅÉì

cd ../..
v8unpack.exe -E bin\%PRODUCT%_%PREFIX%_%DESCENT%.cfe src\%PREFIX% --index cmd\%SUBSYSTEM%\index.json --descent %DESCENT%
pause