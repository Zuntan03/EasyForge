@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace-File.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\ControlNet

@REM https://huggingface.co/2vXpSwA7/iroiro-lora
call %DL_HF% Pony CN-anytest_v4-marged_pn_dim64.safetensors 2vXpSwA7/iroiro-lora test_controlnet2/
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\ControlNet
