@echo off
chcp 65001 > NUL
set GITHUB=%~dp0..\git\GitHub-CloneOrPull.bat

pushd %~dp0..\..\ComfyUI

call %~dp0..\python\Python-Activate.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI
pushd %~dp0..\..\ComfyUI\custom_nodes

@REM https://github.com/kwaroran/abg-comfyui
call :GITHUB_UPDATE kwaroran abg-comfyui main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/chrisgoringe/cg-use-everywhere
call :GITHUB_UPDATE chrisgoringe cg-use-everywhere main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/lldacing/ComfyUI_BiRefNet_ll
call :GITHUB_UPDATE lldacing ComfyUI_BiRefNet_ll main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/SeargeDP/ComfyUI_Searge_LLM
call :GITHUB_UPDATE SeargeDP ComfyUI_Searge_LLM main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/pythongosssss/ComfyUI-Custom-Scripts
call :GITHUB_UPDATE pythongosssss ComfyUI-Custom-Scripts main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-Florence2
call :GITHUB_UPDATE kijai ComfyUI-Florence2 main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist ..\models\LLM\ ( mkdir ..\models\LLM )
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/city96/ComfyUI-GGUF
call :GITHUB_UPDATE city96 ComfyUI-GGUF main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/ltdrdata/ComfyUI-Impact-Pack
call :GITHUB_UPDATE ltdrdata ComfyUI-Impact-Pack Main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/ltdrdata/ComfyUI-Impact-Pack/commit/b5abf19a1b0726cde69fcbb7f7b592c8ad8e067e
echo python -s ComfyUI-Impact-Pack\install.py
python -s ComfyUI-Impact-Pack\install.py
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM https://github.com/ltdrdata/ComfyUI-Impact-Pack/issues/689
@REM https://github.com/ltdrdata/ComfyUI-Impact-Pack/blob/Main/troubleshooting/TROUBLESHOOTING.md
echo pip install -qq ultralytics
pip install -qq ultralytics
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM https://github.com/john-mnz/ComfyUI-Inspyrenet-Rembg
call :GITHUB_UPDATE john-mnz ComfyUI-Inspyrenet-Rembg main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-KJNodes
call :GITHUB_UPDATE kijai ComfyUI-KJNodes main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/Layer-norm/comfyui-lama-remover
call :GITHUB_UPDATE Layer-norm comfyui-lama-remover master
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/ltdrdata/ComfyUI-Manager
call :GITHUB_UPDATE ltdrdata ComfyUI-Manager main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/pamparamm/ComfyUI-ppm
call :GITHUB_UPDATE pamparamm ComfyUI-ppm master
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM GGUF model_name
@REM @REM https://github.com/receyuki/comfyui-prompt-reader-node
@REM call :GITHUB_UPDATE receyuki comfyui-prompt-reader-node main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM echo git -C comfyui-prompt-reader-node submodule update --init --recursive
@REM git -C comfyui-prompt-reader-node submodule update --init --recursive
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM echo git -C comfyui-prompt-reader-node pull --recurse-submodules
@REM git -C comfyui-prompt-reader-node pull --recurse-submodules
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM https://github.com/SeanScripts/ComfyUI-Unload-Model
call :GITHUB_UPDATE SeanScripts ComfyUI-Unload-Model main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/rgthree/rgthree-comfy
call :GITHUB_UPDATE rgthree rgthree-comfy main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/WASasquatch/was-node-suite-comfyui
call :GITHUB_UPDATE WASasquatch was-node-suite-comfyui main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\custom_nodes
exit /b 0

:GITHUB_UPDATE
set "GITHUB_AUTHOR=%1"
set "GITHUB_REPO=%2"
set "GITHUB_BRANCH=%3"

call %GITHUB% %GITHUB_AUTHOR% %GITHUB_REPO% %GITHUB_BRANCH%
if %ERRORLEVEL% neq 0 ( exit /b 1 )

if exist %GITHUB_REPO%\requirements.txt (
	setlocal enabledelayedexpansion
	echo pip install -qq -r %GITHUB_REPO%\requirements.txt
	pip install -qq -r %GITHUB_REPO%\requirements.txt
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )
	endlocal
)
exit /b 0
