@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion

if exist "Flux\flux1-schnell-Q8_0.gguf" (
    if not exist "FluxS-Base\flux1-schnell-Q8_0.gguf" (
		if not exist "FluxS-Base" ( mkdir "FluxS-Base" )
		move /Y "Flux\flux1-schnell-Q8_0.*" "FluxS-Base\"
    )
)

@REM https://huggingface.co/city96/FLUX.1-schnell-gguf
call %DL_HF% FluxS-Base\ flux1-schnell-Q8_0.gguf city96/FLUX.1-schnell-gguf
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion
