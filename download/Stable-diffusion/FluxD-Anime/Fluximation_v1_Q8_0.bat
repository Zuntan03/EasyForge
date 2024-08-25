@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion

if exist "FluxD-Anime\Fluximation_v1_Q8_0.gguf" (
	echo https://civitai.com/models/652994?modelVersionId=738454 Fluximation_v1_Q8_0.gguf
	popd & exit /b 0
)

call %DL_CV% FluxD-Anime\ Fluximation_v1_Q8_0.zip 652994 738454
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion\FluxD-Anime

echo  %PS_CMD% "try { Expand-Archive -Path Fluximation_v1_Q8_0.zip -DestinationPath . -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path Fluximation_v1_Q8_0.zip -DestinationPath . -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo del /Q Fluximation_v1_Q8_0.zip
del /Q Fluximation_v1_Q8_0.zip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion\FluxD-Anime
