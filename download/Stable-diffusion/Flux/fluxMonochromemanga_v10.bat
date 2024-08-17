@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\..\setup\download\CivitaiModel.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion

@REM https://civitai.com/models/655408?modelVersionId=733261
call %DL_CV% Flux fluxMonochromemanga_v10.safetensors 655408 733261
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion
