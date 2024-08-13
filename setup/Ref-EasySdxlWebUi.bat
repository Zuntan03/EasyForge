@echo off
chcp 65001 > NUL

set SDXL_WEB_UI=%~1\SdxlWebUi
if not exist "%SDXL_WEB_UI%" (
	echo "[ERROR] Drag and Drop EasySdxlWebUi installed folder. %SDXL_WEB_UI%"
	pause & exit /b 1
)

call %~dp0ref\Ref-embeddings.bat "%SDXL_WEB_UI%\Embedding"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ref\Ref-adetailer.bat "%SDXL_WEB_UI%\stable-diffusion-webui-forge\models\adetailer"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ref\Ref-ControlNet.bat "%SDXL_WEB_UI%\ControlNet"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ref\Ref-ESRGAN.bat "%SDXL_WEB_UI%\Upscaler"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ref\Ref-Lora.bat "%SDXL_WEB_UI%\Lora"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ref\Ref-Stable-diffusion.bat "%SDXL_WEB_UI%\Model"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ref\Ref-VAE.bat "%SDXL_WEB_UI%\Vae"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ref\Ref-wildcards.bat "%SDXL_WEB_UI%\Wildcard"
if %ERRORLEVEL% neq 0 ( exit /b 1 )
