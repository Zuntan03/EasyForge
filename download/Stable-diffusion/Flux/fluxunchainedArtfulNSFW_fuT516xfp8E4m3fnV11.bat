@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\..\setup\download\CivitaiModel.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion

@REM https://civitai.com/models/645943?modelVersionId=722620
call %DL_CV% Flux fluxunchainedArtfulNSFW_fuT516xfp8E4m3fnV11.safetensors 645943 722620
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion
