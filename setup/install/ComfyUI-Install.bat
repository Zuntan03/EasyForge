@echo off
chcp 65001 > NUL
pushd %~dp0..\..

@REM https://github.com/comfyanonymous/ComfyUI
call %~dp0..\git\GitHub-CloneOrPull.bat comfyanonymous ComfyUI master
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..
pushd %~dp0..\..\ComfyUI

call %~dp0..\python\Python-Activate.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo python -m pip install -qq --upgrade pip
python -m pip install -qq --upgrade pip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo pip install -qq torch==2.4.1+cu124 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
pip install -qq torch==2.4.1+cu124 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo pip install -qq -r requirements.txt
pip install -qq -r requirements.txt
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI
