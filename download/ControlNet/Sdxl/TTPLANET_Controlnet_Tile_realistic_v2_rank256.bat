@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\ControlNet

@REM https://huggingface.co/TTPlanet/TTPLanet_SDXL_Controlnet_Tile_Realistic
call %DL_HF% Sdxl\ TTPLANET_Controlnet_Tile_realistic_v2_rank256.safetensors TTPlanet/TTPLanet_SDXL_Controlnet_Tile_Realistic
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\ControlNet
