@echo off
chcp 65001 > NUL
pushd %~dp0..

@REM https://github.com/kohya-ss/sd-scripts
call %~dp0git\GitHub-CloneOrPull.bat kohya-ss sd-scripts main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

git -C sd-scripts switch -C sd3 origin/sd3 --quiet
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..
pushd %~dp0..\sd-scripts

call %~dp0python\Python-Activate.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo python -m pip install -qq --upgrade pip
python -m pip install -qq --upgrade pip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo pip install -qq torch==2.3.1+cu121 torchvision --index-url https://download.pytorch.org/whl/cu121
pip install -qq torch==2.3.1+cu121 torchvision --index-url https://download.pytorch.org/whl/cu121
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM torch 2.4.1
@REM Error loading "sd-scripts\venv\lib\site-packages\torch\lib\fbgemm.dll" or one of its dependencies.
@REM echo pip install -qq torch==2.4.0+cu124 torchvision --index-url https://download.pytorch.org/whl/cu124
@REM pip install -qq torch==2.4.0+cu124 torchvision --index-url https://download.pytorch.org/whl/cu124
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo pip install -qq -r requirements.txt
pip install -qq -r requirements.txt
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM pip install xformers==0.0.23.post1 --index-url https://download.pytorch.org/whl/cu118
popd rem %~dp0..\sd-scripts
