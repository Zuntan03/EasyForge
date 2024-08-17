@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\stable-diffusion-webui-forge\extensions\sd-dynamic-prompts\wildcards

if exist "extremely_beautiful_clothes.txt" (
	echo https://civitai.com/models/78026?modelVersionId=82802 extremely_beautiful_clothes.txt
	popd & exit /b 0
)

call %DL_CV% . extremely_beautiful_clothes.zip 78026 82802
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo  %PS_CMD% "try { Expand-Archive -Path extremely_beautiful_clothes.zip -DestinationPath . -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path extremely_beautiful_clothes.zip -DestinationPath . -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo del /Q extremely_beautiful_clothes.zip
del /Q extremely_beautiful_clothes.zip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo ren "Extremely beautiful clothes(different stlyes).txt" "extremely_beautiful_clothes.txt"
ren "Extremely beautiful clothes(different stlyes).txt" "extremely_beautiful_clothes.txt"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\stable-diffusion-webui-forge\extensions\sd-dynamic-prompts\wildcards
