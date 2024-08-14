@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion

@REM https://huggingface.co/lllyasviel/flux1-dev-bnb-nf4
call %DL_HF% Flux flux1-dev-bnb-nf4-v2.safetensors lllyasviel/flux1-dev-bnb-nf4
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion
