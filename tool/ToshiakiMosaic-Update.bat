@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
pushd %~dp0

set MOSAIC=mosaic_20240601

@REM https://wikiwiki.jp/sd_toshiaki/%E3%82%88%E3%81%8F%E3%81%82%E3%82%8B%E8%B3%AA%E5%95%8F#je61f50a
echo https://wikiwiki.jp/sd_toshiaki/%%E3%%82%%88%%E3%%81%%8F%%E3%%81%%82%%E3%%82%%8B%%E8%%B3%%AA%%E5%%95%%8F#je61f50a

echo %CURL_CMD% -o "%MOSAIC%.zip" https://cdn.wikiwiki.jp/to/w/sd_toshiaki/%%E3%%82%%88%%E3%%81%%8F%%E3%%81%%82%%E3%%82%%8B%%E8%%B3%%AA%%E5%%95%%8F/::attach/%MOSAIC%.zip
%CURL_CMD% -o "%MOSAIC%.zip" https://cdn.wikiwiki.jp/to/w/sd_toshiaki/%%E3%%82%%88%%E3%%81%%8F%%E3%%81%%82%%E3%%82%%8B%%E8%%B3%%AA%%E5%%95%%8F/::attach/%MOSAIC%.zip
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo  %PS_CMD% "try { Expand-Archive -Path %MOSAIC%.zip -DestinationPath %MOSAIC% -Force } catch { exit 1 }"
%PS_CMD% "try { Expand-Archive -Path %MOSAIC%.zip -DestinationPath %MOSAIC% -Force } catch { exit 1 }"
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )

echo del /Q %MOSAIC%.zip
del /Q %MOSAIC%.zip
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )

popd rem %~dp0
pushd %~dp0%MOSAIC%

call %~dp0..\setup\python\Python-Activate.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo python -m pip install -qq --upgrade pip
python -m pip install -qq --upgrade pip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo pip install -r requirements.txt
pip install -r requirements.txt
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0%MOSAIC%
