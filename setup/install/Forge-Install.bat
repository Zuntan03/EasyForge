@echo off
chcp 65001 > NUL
pushd %~dp0..\..

@REM https://github.com/lllyasviel/stable-diffusion-webui-forge
call %~dp0..\git\GitHub-CloneOrPull.bat lllyasviel stable-diffusion-webui-forge main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

copy /Y setup\install\EasyForgeInstaller.bat Update.bat > NUL
if %ERRORLEVEL% neq 0 ( pause & popd & 1 )

popd rem %~dp0..\..
pushd %~dp0..\..\stable-diffusion-webui-forge

call %~dp0..\python\Python-Activate.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo python -m pip install -qq --upgrade pip
python -m pip install -qq --upgrade pip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM echo pip install -qq torch==2.3.1+cu121 torchvision --index-url https://download.pytorch.org/whl/cu121
@REM pip install -qq torch==2.3.1+cu121 torchvision --index-url https://download.pytorch.org/whl/cu121
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo pip install -qq torch==2.4.1+cu124 torchvision --index-url https://download.pytorch.org/whl/cu124
pip install -qq torch==2.4.1+cu124 torchvision --index-url https://download.pytorch.org/whl/cu124
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo pip install -qq https://github.com/oobabooga/llama-cpp-python-cuBLAS-wheels/releases/download/cpu/llama_cpp_python-0.2.89+cpuavx2-cp310-cp310-win_amd64.whl
pip install -qq https://github.com/oobabooga/llama-cpp-python-cuBLAS-wheels/releases/download/cpu/llama_cpp_python-0.2.89+cpuavx2-cp310-cp310-win_amd64.whl
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo pip install -qq https://github.com/oobabooga/llama-cpp-python-cuBLAS-wheels/releases/download/textgen-webui/llama_cpp_python_cuda-0.2.89+cu121-cp310-cp310-win_amd64.whl
pip install -qq https://github.com/oobabooga/llama-cpp-python-cuBLAS-wheels/releases/download/textgen-webui/llama_cpp_python_cuda-0.2.89+cu121-cp310-cp310-win_amd64.whl
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

if not exist "models\Lora" ( mkdir "models\Lora" )

popd rem %~dp0..\..\stable-diffusion-webui-forge

@REM Delete old files
pushd %~dp0..\..\stable-diffusion-webui-forge\extensions

if exist sd-civitai-browser-plus\ (
	setlocal enabledelayedexpansion
		echo rmdir /S /Q sd-civitai-browser-plus\
		rmdir /S /Q sd-civitai-browser-plus\
		if !ERRORLEVEL! neq 0 ( pause & endlocal & popd & exit /b 1 )
	endlocal
)

popd rem %~dp0..\..\stable-diffusion-webui-forge\extensions
