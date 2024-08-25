@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\..\setup\download\CivitaiModel.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Lora

@REM https://civitai.com/models/180891?modelVersionId=738709
call %DL_CV% FluxD-Anime\ fca_style_v3.2.safetensors 180891 738709
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Lora
