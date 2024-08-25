@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion

@REM https://huggingface.co/Anibaaal/Flux-Fusion-DS-merge-gguf-nf4-fp4-fp8-fp16
call %DL_HF% FluxDS-Base\ FluxFusionDS_v0_nf4.safetensors Anibaaal/Flux-Fusion-DS-merge-gguf-nf4-fp4-fp8-fp16 UNET/
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion
