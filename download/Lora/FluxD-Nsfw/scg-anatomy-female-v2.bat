@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\..\setup\download\CivitaiModel.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Lora

@REM https://civitai.com/models/640156?modelVersionId=736227
call %DL_CV% FluxD-Nsfw\ scg-anatomy-female-v2.safetensors 640156 736227
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Lora
