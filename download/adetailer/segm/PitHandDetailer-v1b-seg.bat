@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\segm

@REM if exist "PitHandDetailer-v1b-seg.pt" (
@REM 	echo https://civitai.com/models/329458?modelVersionId=411421 PitHandDetailer-v1b-seg.pt
@REM 	popd & exit /b 0
@REM )

@REM call %DL_CV% .\ PitHandDetailer-v1b-seg.zip 329458 411421
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM echo  %PS_CMD% "try { Expand-Archive -Path PitHandDetailer-v1b-seg.zip -DestinationPath . -Force } catch { exit 1 }"
@REM %PS_CMD% "try { Expand-Archive -Path PitHandDetailer-v1b-seg.zip -DestinationPath . -Force } catch { exit 1 }"
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM echo del /Q PitHandDetailer-v1b-seg.zip
@REM del /Q PitHandDetailer-v1b-seg.zip
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo https://civitai.com/models/329458?modelVersionId=411421
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
@REM https://huggingface.co/SDExplains/Adetailer
call %DL_HF% .\ PitHandDetailer-v1b-seg.pt SDExplains/Adetailer
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\segm
