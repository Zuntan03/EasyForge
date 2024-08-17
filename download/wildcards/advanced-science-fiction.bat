@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\stable-diffusion-webui-forge\extensions\sd-dynamic-prompts\wildcards

if exist "advanced\science-fiction-locations.txt" (
	echo https://civitai.com/models/70905?modelVersionId=75600 advanced\science-fiction-locations.txt
	popd & exit /b 0
)

call %DL_CV% . advanced-science-fiction.zip 70905 75600
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo  %PS_CMD% "try { Expand-Archive -Path advanced-science-fiction.zip -DestinationPath advanced -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path advanced-science-fiction.zip -DestinationPath advanced -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo del /Q advanced-science-fiction.zip
del /Q advanced-science-fiction.zip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

pushd advanced
for %%f in (advanced-*) do (
	setlocal enabledelayedexpansion
	set "ADVANCED_FILENAME=%%f"
	echo ren "%%f" "!ADVANCED_FILENAME:advanced-=!"
	ren "%%f" "!ADVANCED_FILENAME:advanced-=!"
	endlocal
)
popd rem advanced

popd rem %~dp0..\..\stable-diffusion-webui-forge\extensions\sd-dynamic-prompts\wildcards
