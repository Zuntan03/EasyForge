@echo off
chcp 65001 > NUL
set "LINK_DIR=%~dp0LinkDir.bat"
set "FORGE_BASE=%~dp0..\..\stable-diffusion-webui-forge"
set "FORGE_MODEL=%FORGE_BASE%\models"

pushd %~dp0..\..

if not exist ComfyUI\output\ ( mkdir ComfyUI\output )
if not exist outputs\txt2img-images\ ( mkdir outputs\txt2img-images )

call "%LINK_DIR%" outputs\txt2img-images\ComfyUI "ComfyUI\output"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call "%LINK_DIR%" ComfyUI-Output "ComfyUI\output"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist ComfyUI\user\default\ ( mkdir ComfyUI\user\default )
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

call "%LINK_DIR%" "ComfyUI\user\default\workflows" ComfyUI-Workflow
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..

pushd %~dp0..\..\ComfyUI\models
call "%LINK_DIR%" checkpoints "%FORGE_MODEL%\Stable-diffusion"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call "%LINK_DIR%" unet "%FORGE_MODEL%\Stable-diffusion"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call "%LINK_DIR%" clip "%FORGE_MODEL%\VAE"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call "%LINK_DIR%" controlnet "%FORGE_MODEL%\ControlNet"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist "%FORGE_MODEL%\Lora" ( mkdir "%FORGE_MODEL%\Lora" )

call "%LINK_DIR%" loras "%FORGE_MODEL%\Lora"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call "%LINK_DIR%" ultralytics "%FORGE_MODEL%\adetailer"
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
