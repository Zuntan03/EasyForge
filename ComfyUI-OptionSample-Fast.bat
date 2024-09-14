@echo off
chcp 65001 > NUL

call %~dp0ComfyUI.bat --fast %*
