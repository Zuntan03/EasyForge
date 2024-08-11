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

popd rem %~dp0..\..\stable-diffusion-webui-forge
