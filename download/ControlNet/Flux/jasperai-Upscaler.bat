@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\ControlNet

@REM https://huggingface.co/jasperai/Flux.1-dev-Controlnet-Upscaler
call %DL_HF% Flux\ jasperai-Upscaler.safetensors jasperai/Flux.1-dev-Controlnet-Upscaler diffusion_pytorch_model.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\ControlNet
