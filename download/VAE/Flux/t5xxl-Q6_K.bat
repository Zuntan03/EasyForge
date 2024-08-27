@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\VAE

@REM https://huggingface.co/city96/t5-v1_1-xxl-encoder-gguf
call %DL_HF% Flux\ t5xxl-Q6_K.gguf city96/t5-v1_1-xxl-encoder-gguf t5-v1_1-xxl-encoder-Q6_K.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\VAE
