@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\ControlNet

@REM https://huggingface.co/2vXpSwA7/iroiro-lora
call %DL_HF% Sdxl\ cnlllite-anystyle_v3-step00005000.safetensors 2vXpSwA7/iroiro-lora test_controlnet/
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\ControlNet
