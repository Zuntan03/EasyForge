@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace-File.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Lora

@REM https://huggingface.co/ByteDance/Hyper-SD
call %DL_HF% Sdxl Hyper-SDXL-8steps-lora.safetensors ByteDance/Hyper-SD
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Lora
