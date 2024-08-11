@echo off
chcp 65001 > NUL
pushd %~dp0..\..\stable-diffusion-webui-forge
set LINK_DIR=%~dp0LinkDir.bat

call %LINK_DIR% ..\models models
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist output (
	echo mkdir output
	mkdir output
)
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

call %LINK_DIR% ..\output output
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist extensions\sd-dynamic-prompts\wildcards (
	echo mkdir extensions\sd-dynamic-prompts\wildcards
	mkdir extensions\sd-dynamic-prompts\wildcards
)
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

call %LINK_DIR% ..\wildcards extensions\sd-dynamic-prompts\wildcards
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\stable-diffusion-webui-forge
