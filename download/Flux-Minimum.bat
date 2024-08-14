@echo off
chcp 65001 > NUL

call %~dp0ESRGAN\4x-AnimeSharp.bat
call %~dp0ESRGAN\4x-UltraSharp.bat

call %~dp0Stable-diffusion\Flux\flux1-schnell-bnb-nf4.bat
