@echo off
chcp 65001 > NUL
set GITHUB=%~dp0..\git\GitHub-CloneOrPull.bat

pushd %~dp0..\..\ComfyUI

call %~dp0..\python\Python-Activate.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI
pushd %~dp0..\..\ComfyUI\custom_nodes

@REM https://github.com/chrisgoringe/cg-use-everywhere
call %GITHUB% chrisgoringe cg-use-everywhere main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/SeargeDP/ComfyUI_Searge_LLM
call %GITHUB% SeargeDP ComfyUI_Searge_LLM main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo pip install -qq https://github.com/oobabooga/llama-cpp-python-cuBLAS-wheels/releases/download/cpu/llama_cpp_python-0.2.89+cpuavx2-cp310-cp310-win_amd64.whl
pip install -qq https://github.com/oobabooga/llama-cpp-python-cuBLAS-wheels/releases/download/cpu/llama_cpp_python-0.2.89+cpuavx2-cp310-cp310-win_amd64.whl
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo pip install -qq https://github.com/oobabooga/llama-cpp-python-cuBLAS-wheels/releases/download/textgen-webui/llama_cpp_python_cuda-0.2.89+cu121-cp310-cp310-win_amd64.whl
pip install -qq https://github.com/oobabooga/llama-cpp-python-cuBLAS-wheels/releases/download/textgen-webui/llama_cpp_python_cuda-0.2.89+cu121-cp310-cp310-win_amd64.whl
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM https://github.com/pythongosssss/ComfyUI-Custom-Scripts
call %GITHUB% pythongosssss ComfyUI-Custom-Scripts main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/city96/ComfyUI-GGUF
call %GITHUB% city96 ComfyUI-GGUF main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/ltdrdata/ComfyUI-Impact-Pack
call %GITHUB% ltdrdata ComfyUI-Impact-Pack Main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-KJNodes
call %GITHUB% kijai ComfyUI-KJNodes main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/ltdrdata/ComfyUI-Manager
call %GITHUB% ltdrdata ComfyUI-Manager main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/SeanScripts/ComfyUI-Unload-Model
call %GITHUB% SeanScripts ComfyUI-Unload-Model main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/rgthree/rgthree-comfy
call %GITHUB% rgthree rgthree-comfy main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/WASasquatch/was-node-suite-comfyui
call %GITHUB% WASasquatch was-node-suite-comfyui main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo pip install -qq numba==0.60.0
pip install -qq numba==0.60.0
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\custom_nodes
pushd %~dp0..\..\ComfyUI\custom_nodes\ComfyUI-GGUF

echo pip install -qq --upgrade gguf
pip install -qq --upgrade gguf
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\custom_nodes\ComfyUI-GGUF