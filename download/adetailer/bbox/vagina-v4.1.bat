@echo off
chcp 65001 > NUL
set DL_CV=%~dp0..\..\..\setup\download\CivitaiModel.bat
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\bbox

if exist "vagina-v4.1.pt" (
	echo https://civitai.com/models/150872?modelVersionId=484684 vagina-v4.1.pt
	popd & exit /b 0
)

call %DL_CV% .\ vagina-v4.1.zip 150872 484684
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )
urn:air:multi:unknown:civitai:@
echo  %PS_CMD% "try { Expand-Archive -Path vagina-v4.1.zip -DestinationPath . -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path vagina-v4.1.zip -DestinationPath . -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo del /Q vagina-v4.1.zip
del /Q vagina-v4.1.zip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\adetailer\bbox
