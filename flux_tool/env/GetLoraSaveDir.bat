@echo off
chcp 65001 > NUL

set "SAVE_DIR=%~1"
if not "%SAVE_DIR:\Stable-diffusion\=%" == "%SAVE_DIR%" ( set "SAVE_DIR=%SAVE_DIR:\Stable-diffusion\=\Lora\%" )
if not exist "%SAVE_DIR%" ( mkdir "%SAVE_DIR%" )

