@echo off
chcp 65001 > NUL
pushd %~dp0..\..

@REM https://github.com/comfyanonymous/ComfyUI
@REM Impact-Pack AnySwitch select bug https://github.com/comfyanonymous/ComfyUI/commit/614377abd6c018dec4aeb5700c0e203e2f91f9b0
@REM Prev commit https://github.com/comfyanonymous/ComfyUI/commit/8dfa0cc55242f9519424cd97fbe2f420798d56da
call %~dp0..\git\GitHub-CloneOrPull.bat comfyanonymous ComfyUI master 8dfa0cc55242f9519424cd97fbe2f420798d56da
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
