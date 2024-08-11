@echo off
chcp 65001 > NUL
pushd %~dp0

@REM https://github.com/zanllp/sd-webui-infinite-image-browsing
call %~dp0..\setup\git\GitHub-CloneOrPull.bat zanllp sd-webui-infinite-image-browsing main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0
pushd %~dp0sd-webui-infinite-image-browsing

call %~dp0..\setup\python\Python-Activate.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo python -m pip install -qq --upgrade pip
python -m pip install -qq --upgrade pip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo pip install -r requirements.txt
pip install -r requirements.txt
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0sd-webui-infinite-image-browsing
