@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion

if exist "Flux\FusionDS_v0_Q8.gguf" (
	echo https://civitai.com/models/630820?modelVersionId=736153 FusionDS_v0_Q8.gguf
	popd & exit /b 0
)

call %DL_CV% Flux FusionDS_v0_Q8.zip 630820 736153
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion\Flux

echo  %PS_CMD% "try { Expand-Archive -Path FusionDS_v0_Q8.zip -DestinationPath . -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path FusionDS_v0_Q8.zip -DestinationPath . -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo del /Q FusionDS_v0_Q8.zip
del /Q FusionDS_v0_Q8.zip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Stable-diffusion\Flux
