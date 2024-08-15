@echo off
chcp 65001 > NUL

call %~dp0Flux-Minimum.bat

call %~dp0Stable-diffusion\Flux\flux1-dev-bnb-nf4-v2.bat
call %~dp0Stable-diffusion\Flux\fluxunchainedArtfulNSFW_fuT58x8E4m3fnV11.bat
