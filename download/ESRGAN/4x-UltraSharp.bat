@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\stable-diffusion-webui-forge\models\ESRGAN

@REM https://huggingface.co/Zuntan/dist
call %DL_HF% .\ 4x-UltraSharp.pth Zuntan/dist
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\stable-diffusion-webui-forge\models\ESRGAN
