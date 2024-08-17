@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\stable-diffusion-webui-forge\models\adetailer

if exist "penis.pt" (
	echo https://civitai.com/models/247561?modelVersionId=279310 penis.pt
	popd & exit /b 0
)

call %DL_CV% . penis.zip 247561 279310
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo  %PS_CMD% "try { Expand-Archive -Path penis.zip -DestinationPath . -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path penis.zip -DestinationPath . -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo del /Q penis.zip
del /Q penis.zip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\stable-diffusion-webui-forge\models\adetailer
