@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\segm

@REM https://huggingface.co/Anzhc/Anzhcs_YOLOs
call %DL_HF% .\ AnzhcFace-v2-1024-seg.pt Anzhc/Anzhcs_YOLOs Anzhc%%%%%%%%20Face%%%%%%%%20seg%%%%%%%%201024%%%%%%%%20v2%%%%%%%%20y8n.pt?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\segm
