@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\bbox

if exist "Eyes.pt" (
	echo https://civitai.com/models/150925?modelVersionId=168820 Eyes.pt
	popd & exit /b 0
)

if exist "..\Eyes.pt" (
	echo https://civitai.com/models/150925?modelVersionId=168820 Eyes.pt
	move /Y "..\Eyes.pt" .
	popd & exit /b 0
)

call %DL_CV% .\ Eyes.zip 150925 168820
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo  %PS_CMD% "try { Expand-Archive -Path Eyes.zip -DestinationPath . -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path Eyes.zip -DestinationPath . -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo del /Q Eyes.zip
del /Q Eyes.zip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\bbox
