@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\stable-diffusion-webui-forge\models\adetailer

if exist "Eyeful_v2-Paired.pt" (
	echo https://civitai.com/models/178518?modelVersionId=582143 Eyeful_v2-Paired.pt
	popd & exit /b 0
)

call %DL_CV% . Eyeful_v2-Paired.zip 178518 582143
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo  %PS_CMD% "try { Expand-Archive -Path Eyeful_v2-Paired.zip -DestinationPath . -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path Eyeful_v2-Paired.zip -DestinationPath . -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )

echo del /Q Eyeful_v2-Paired.zip
del /Q Eyeful_v2-Paired.zip
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )

popd rem %~dp0..\..\stable-diffusion-webui-forge\models\adetailer
