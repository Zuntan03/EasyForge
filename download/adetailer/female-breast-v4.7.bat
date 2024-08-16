@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\stable-diffusion-webui-forge\models\adetailer

if exist "female-breast-v4.7.pt" (
	echo https://civitai.com/models/138918?modelVersionId=688769 female-breast-v4.7.pt
	popd & exit /b 0
)

call %DL_CV% . female-breast-v4.7.zip 138918 688769
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo  %PS_CMD% "try { Expand-Archive -Path female-breast-v4.7.zip -DestinationPath . -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path female-breast-v4.7.zip -DestinationPath . -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )

echo del /Q female-breast-v4.7.zip
del /Q female-breast-v4.7.zip
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )

popd rem %~dp0..\..\stable-diffusion-webui-forge\models\adetailer
