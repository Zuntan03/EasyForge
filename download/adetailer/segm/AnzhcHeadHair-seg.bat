@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\segm

@REM https://huggingface.co/Anzhc/Anzhcs_YOLOs
call %DL_HF% .\ AnzhcHeadHair-seg.pt Anzhc/Anzhcs_YOLOs Anzhc%%%%%%%%20Head%%%%%%%%2BHair%%%%%%%%20seg%%%%%%%%20y8m.pt?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\segm
