@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion

if exist "Flux\flux1-dev-bnb-nf4-v2.safetensors" (
    if not exist "FluxD-Base\flux1-dev-bnb-nf4-v2.safetensors" (
		if not exist "FluxD-Base" ( mkdir "FluxD-Base" )
		move /Y "Flux\flux1-dev-bnb-nf4-v2.*" "FluxD-Base\"
    )
)

@REM https://huggingface.co/lllyasviel/flux1-dev-bnb-nf4
call %DL_HF% FluxD-Base\ flux1-dev-bnb-nf4-v2.safetensors lllyasviel/flux1-dev-bnb-nf4
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion
