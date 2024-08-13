@echo off
chcp 65001 > NUL

call %~dp0Flux-Minimum.bat

call %~dp0Stable-diffusion\Flux\flux1-dev-bnb-nf4.bat
