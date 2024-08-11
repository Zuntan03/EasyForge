@echo off
set FORGE_CONFIG_PATH=config-CivitaiBrowserPlus.json
call %~dp0Forge.bat --always-offload-from-vram %*
