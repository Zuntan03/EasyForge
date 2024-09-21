@echo off
chcp 65001 > NUL
pushd %~dp0..\..\stable-diffusion-webui-forge
set LINK_DIR=%~dp0LinkDir.bat

call %LINK_DIR% ..\models models
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist outputs (
	echo mkdir outputs
	mkdir outputs
)
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

call %LINK_DIR% ..\outputs outputs
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist extensions\sd-dynamic-prompts\wildcards (
	echo mkdir extensions\sd-dynamic-prompts\wildcards
	mkdir extensions\sd-dynamic-prompts\wildcards
)
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

call %LINK_DIR% ..\wildcards extensions\sd-dynamic-prompts\wildcards
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist models\adetailer\bbox (
	echo mkdir models\adetailer\bbox
	mkdir models\adetailer\bbox
)
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

if not exist models\adetailer\segm (
	echo mkdir models\adetailer\segm
	mkdir models\adetailer\segm
)
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\stable-diffusion-webui-forge
