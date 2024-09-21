@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\segm

if exist "nipples_yolov8s-seg.pt" (
	echo https://civitai.com/models/490259?modelVersionId=863091 nipples_yolov8s-seg.pt
	popd & exit /b 0
)

call %DL_CV% .\ nipples_yolov8s-seg.zip 490259 863091
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo  %PS_CMD% "try { Expand-Archive -Path nipples_yolov8s-seg.zip -DestinationPath . -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path nipples_yolov8s-seg.zip -DestinationPath . -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo del /Q nipples_yolov8s-seg.zip
del /Q nipples_yolov8s-seg.zip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\segm
