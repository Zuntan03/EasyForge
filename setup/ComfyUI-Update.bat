@echo off
chcp 65001 > NUL

call %~dp0install\ComfyUI-Install.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %~dp0install\ComfyUI-CustomNode.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %~dp0..\download\ComfyUI-Minimum.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %~dp0install\ComfyUI-Link.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if exist %~dp0..\ComfyUI-Workflow\01-日本語LLMでFlux.json (
	echo del %~dp0..\ComfyUI-Workflow\01-日本語LLMでFlux.json
	del %~dp0..\ComfyUI-Workflow\01-日本語LLMでFlux.json
)

if exist %~dp0..\ComfyUI-Workflow\21-画像からモノを削除.json (
	echo del %~dp0..\ComfyUI-Workflow\21-画像からモノを削除.json
	del %~dp0..\ComfyUI-Workflow\21-画像からモノを削除.json
)

if exist %~dp0..\ComfyUI-Workflow\41-自動検出書き換えで手直しやディティールアップ.json (
	echo del %~dp0..\ComfyUI-Workflow\41-自動検出書き換えで手直しやディティールアップ.json
	del %~dp0..\ComfyUI-Workflow\41-自動検出書き換えで手直しやディティールアップ.json
)

@REM minimum DL
