@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion

@REM https://huggingface.co/Zuntan/waiAniFlux_v10-8step
call %DL_HF% FluxD-Anime\ waiAniFlux_v10-x05-8step-Q4_K_S.gguf Zuntan/waiAniFlux_v10-8step
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion
