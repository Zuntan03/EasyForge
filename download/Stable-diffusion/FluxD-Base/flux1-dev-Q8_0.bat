@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion

if exist "Flux\flux1-dev-Q8_0.gguf" (
    if not exist "FluxD-Base\flux1-dev-Q8_0.gguf" (
		if not exist "FluxD-Base" ( mkdir "FluxD-Base" )
		move /Y "Flux\flux1-dev-Q8_0.*" "FluxD-Base\"
    )
)

@REM https://huggingface.co/city96/FLUX.1-dev-gguf
call %DL_HF% FluxD-Base\ flux1-dev-Q8_0.gguf city96/FLUX.1-dev-gguf
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion
