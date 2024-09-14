@echo off
chcp 65001 > NUL
set "LINK_DIR=%~dp0LinkDir.bat"
set "FORGE_BASE=%~dp0..\..\stable-diffusion-webui-forge"
set "FORGE_MODEL=%FORGE_BASE%\models"

pushd %~dp0..\..

if not exist ComfyUI\output\ ( mkdir ComfyUI\output )

call "%LINK_DIR%" outputs\txt2img-images\ComfyUI "ComfyUI\output"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call "%LINK_DIR%" ComfyUI-Output "ComfyUI\output"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..

pushd %~dp0..\..\ComfyUI\models
call "%LINK_DIR%" checkpoints "%FORGE_MODEL%\Stable-diffusion"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call "%LINK_DIR%" unet "%FORGE_MODEL%\Stable-diffusion"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call "%LINK_DIR%" clip "%FORGE_MODEL%\VAE"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call "%LINK_DIR%" loras "%FORGE_MODEL%\Lora"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call "%LINK_DIR%" upscale_models "%FORGE_MODEL%\ESRGAN"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call "%LINK_DIR%" vae "%FORGE_MODEL%\VAE"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models
pushd %~dp0..\..\ComfyUI\custom_nodes

call "%LINK_DIR%" ComfyUI-Impact-Pack\wildcards "%FORGE_BASE%\extensions\sd-dynamic-prompts\wildcards"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\custom_nodes
