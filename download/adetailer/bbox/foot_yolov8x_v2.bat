@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\bbox

@REM https://huggingface.co/MonetEinsley/ADetailer_CM
call %DL_HF% .\ foot_yolov8x_v2.pt MonetEinsley/ADetailer_CM
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\bbox
