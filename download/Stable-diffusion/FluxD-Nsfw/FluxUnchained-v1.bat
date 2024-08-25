@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\..\setup\download\CivitaiModel.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion

@REM https://civitai.com/models/645943?modelVersionId=742989
call %DL_CV% FluxD-Nsfw\ FluxUnchained-v1.safetensors 645943 742989
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion
