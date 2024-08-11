@echo off
chcp 65001 > NUL

if not exist %~dp0tool\sd-webui-infinite-image-browsing\venv\ (
	echo call %~dp0tool\InfiniteImageBrowsing-Update.bat
	call %~dp0tool\InfiniteImageBrowsing-Update.bat
)
if not exist %~dp0tool\sd-webui-infinite-image-browsing\venv\ ( pause & exit /b 1 )

pushd %~dp0tool\sd-webui-infinite-image-browsing

call %~dp0setup\python\Python-Activate.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

start http://localhost:8000

set "SD_CFG=%~dp0stable-diffusion-webui-forge\config.json"
echo python app.py --sd_webui_config="%SD_CFG%" --sd_webui_path_relative_to_config --host=localhost --port=8000 %*
python app.py --sd_webui_config="%SD_CFG%" --sd_webui_path_relative_to_config --host=localhost --port=8000 %*
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0tool\sd-webui-infinite-image-browsing
