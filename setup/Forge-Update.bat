@echo off
chcp 65001 > NUL

call %~dp0install\Forge-Install.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %~dp0install\Forge-Extension.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %~dp0install\Forge-Link.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM 不要になったファイルの削除
if exist %~dp0..\download\Flux-Gguf.bat ( del %~dp0..\download\Flux-Gguf.bat )
if exist %~dp0..\download\Stable-diffusion\Flux\ ( rmdir /S /Q %~dp0..\download\Stable-diffusion\Flux\ )

@REM config.json での t5xxl-Q6_K.gguf デフォルト化に伴う特例 DL
if exist "%~dp0..\stable-diffusion-webui-forge\models\VAE\Flux\clip_l.safetensors" (
	if not exist "%~dp0..\stable-diffusion-webui-forge\models\VAE\Flux\t5xxl-Q6_K.gguf" (
		call "%~dp0..\download\VAE\Flux\t5xxl-Q6_K.bat"
	)
)
