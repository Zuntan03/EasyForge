@echo off
chcp 65001 > NUL
@REM set LINK_DIR=%~dp0link

set SDXL_WEB_UI=%~1\SdxlWebUi
if not exist "%SDXL_WEB_UI%" (
	echo "[ERROR] Drag & Drop EasySdxlWebUi folder. %SDXL_WEB_UI%"
	pause & exit /b 1
)

call %~dp0link\Link-embeddings.bat "%SDXL_WEB_UI%\Embedding"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0link\Link-adetailer.bat "%SDXL_WEB_UI%\stable-diffusion-webui-forge\models\adetailer"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0link\Link-ControlNet.bat "%SDXL_WEB_UI%\ControlNet"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0link\Link-ESRGAN.bat "%SDXL_WEB_UI%\Upscaler"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0link\Link-Lora.bat "%SDXL_WEB_UI%\Lora"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0link\Link-Stable-diffusion.bat "%SDXL_WEB_UI%\Model"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0link\Link-VAE.bat "%SDXL_WEB_UI%\Vae"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0link\Link-wildcards.bat "%SDXL_WEB_UI%\Wildcard"
if %ERRORLEVEL% neq 0 ( exit /b 1 )
