@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\VAE

@REM https://huggingface.co/zer0int/CLIP-GmP-ViT-L-14
call %DL_HF% Flux\ ViT-L-14-BEST.safetensors zer0int/CLIP-GmP-ViT-L-14 ViT-L-14-BEST-smooth-GmP-TE-only-HF-format.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\VAE
