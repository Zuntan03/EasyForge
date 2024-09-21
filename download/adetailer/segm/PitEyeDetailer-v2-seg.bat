@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\segm

if exist "PitEyeDetailer-v2-seg.pt" (
	echo https://civitai.com/models/334668?modelVersionId=465360 PitEyeDetailer-v2-seg.pt
	popd & exit /b 0
)

call %DL_CV% .\ PitEyeDetailer-v2-seg.zip 334668 465360
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo  %PS_CMD% "try { Expand-Archive -Path PitEyeDetailer-v2-seg.zip -DestinationPath . -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path PitEyeDetailer-v2-seg.zip -DestinationPath . -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo del /Q PitEyeDetailer-v2-seg.zip
del /Q PitEyeDetailer-v2-seg.zip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\segm
