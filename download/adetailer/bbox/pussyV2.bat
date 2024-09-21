@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\bbox

if exist "pussyV2.pt" (
	echo https://civitai.com/models/132388?modelVersionId=149617 pussyV2.pt
	popd & exit /b 0
)

if exist "..\pussyV2.pt" (
	echo https://civitai.com/models/132388?modelVersionId=149617 pussyV2.pt
	move /Y "..\pussyV2.pt" .
	popd & exit /b 0
)

call %DL_CV% .\ pussyV2.zip 132388 149617
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo  %PS_CMD% "try { Expand-Archive -Path pussyV2.zip -DestinationPath . -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path pussyV2.zip -DestinationPath . -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo del /Q pussyV2.zip
del /Q pussyV2.zip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\bbox
