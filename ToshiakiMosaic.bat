@echo off
chcp 65001 > NUL

set MOSAIC=mosaic_20240601

if not exist %~dp0tool\%MOSAIC%\venv\ (
	echo call %~dp0tool\ToshiakiMosaic-Update.bat
	call %~dp0tool\ToshiakiMosaic-Update.bat
)
if not exist %~dp0tool\%MOSAIC%\venv\ ( pause & exit /b 1 )

pushd %~dp0tool\%MOSAIC%

call %~dp0setup\python\Python-Activate.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo python mosaic.py %*
python mosaic.py %*
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0tool\%MOSAIC%
