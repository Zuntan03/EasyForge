@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace-File.bat
set CURL_CMD=C:\Windows\System32\curl.exe -kL
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion

@REM https://huggingface.co/cagliostrolab/animagine-xl-3.1
call %DL_HF% SDXL animagine-xl-3.1.safetensors cagliostrolab/animagine-xl-3.1
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion
