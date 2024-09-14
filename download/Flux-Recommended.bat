@echo off
chcp 65001 > NUL

call %~dp0Flux-Minimum.bat

call %~dp0all\adetailer.bat
call %~dp0all\wildcards.bat

call %~dp0Stable-diffusion\FluxD-Anime\fca_style-v33-x10-8step-Q4_K_S.bat
call %~dp0Stable-diffusion\FluxD-Anime\MythP0rt-x08-8step-Q4_K_S.bat

call %~dp0Stable-diffusion\FluxD-Base\flux1-dev-Q8_0.bat

call %~dp0Stable-diffusion\FluxD-Nsfw\FluxDev8AnimeNsfw-Q8_0.bat
