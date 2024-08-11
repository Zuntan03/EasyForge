@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace-File.bat
set CURL_CMD=C:\Windows\System32\curl.exe -kL
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion

@REM https://huggingface.co/tsukihara/xl_model
call %DL_HF% Pony ebara_pony_2.1.safetensors tsukihara/xl_model
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist Pony\ebara_pony_2.1.jpg (
	setlocal enabledelayedexpansion
	%CURL_CMD% -o Pony\ebara_pony_2.1.jpg https://huggingface.co/tsukihara/xl_model/resolve/main/sample/ebara_pony_2.jpg
	if !ERRORLEVEL! neq 0 ( pause & endlocal & popd & exit /b 1 )
	endlocal
)

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion
