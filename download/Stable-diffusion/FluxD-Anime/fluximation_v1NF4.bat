@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\..\setup\download\CivitaiModel.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion

@REM https://civitai.com/models/652994?modelVersionId=747633
call %DL_CV% FluxD-Anime\ fluximation_v1NF4.safetensors 652994 747633
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion
