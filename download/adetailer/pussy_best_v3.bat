@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\stable-diffusion-webui-forge\models\adetailer

if exist "pussy_best_v3.pt" (
	echo https://civitai.com/models/150234?modelVersionId=167907 pussy_best_v3.pt
	popd & exit /b 0
)

call %DL_CV% . pussy_best_v3.zip 150234 167907
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo  %PS_CMD% "try { Expand-Archive -Path pussy_best_v3.zip -DestinationPath . -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path pussy_best_v3.zip -DestinationPath . -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo del /Q pussy_best_v3.zip
del /Q pussy_best_v3.zip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\stable-diffusion-webui-forge\models\adetailer
