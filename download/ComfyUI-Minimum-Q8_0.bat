@echo off
chcp 65001 > NUL

call %~dp0ComfyUI-Minimum.bat

call %~dp0Stable-diffusion\FluxD-Anime\fca_style-v33-x10-8step-Q8_0.bat
call %~dp0Stable-diffusion\FluxD-Anime\MythP0rt-x08-8step-Q8_0.bat

call %~dp0Stable-diffusion\FluxD-Nsfw\iNiverseFluxV11-8step-Q8_0.bat
call %~dp0Stable-diffusion\FluxD-Nsfw\iNiverseV11x05-FCAnimeV33x05-8step-Q8_0.bat
