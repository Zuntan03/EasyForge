@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\bbox

if exist "lips_v1.pt" (
	echo https://civitai.com/models/142240?modelVersionId=157700 lips_v1.pt
	popd & exit /b 0
)

if exist "..\lips_v1.pt" (
	echo https://civitai.com/models/142240?modelVersionId=157700 lips_v1.pt
	move /Y "..\lips_v1.pt" .
	popd & exit /b 0
)

call %DL_CV% .\ lips_v1.zip 142240 157700
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo  %PS_CMD% "try { Expand-Archive -Path lips_v1.zip -DestinationPath . -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path lips_v1.zip -DestinationPath . -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo del /Q lips_v1.zip
del /Q lips_v1.zip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\bbox
