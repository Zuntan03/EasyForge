@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\stable-diffusion-webui-forge\extensions\sd-dynamic-prompts\wildcards

if exist "billions_of_all_in_one - v2.43.yaml" (
	echo https://civitai.com/models/138970?modelVersionId=674371 billions_of_all_in_one - v2.43.yaml
	popd & exit /b 0
)

call %DL_CV% . billions_of_all_in_one.zip 138970 674371
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo  %PS_CMD% "try { Expand-Archive -Path billions_of_all_in_one.zip -DestinationPath . -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path billions_of_all_in_one.zip -DestinationPath . -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo del /Q billions_of_all_in_one.zip
del /Q billions_of_all_in_one.zip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\stable-diffusion-webui-forge\extensions\sd-dynamic-prompts\wildcards
