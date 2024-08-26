@echo off
chcp 65001 > NUL

call %~dp0all\ESRGAN.bat

call %~dp0Stable-diffusion\FluxS-Base\flux1-schnell-bnb-nf4-v2.bat

call %~dp0VAE\Flux\ae.bat
call %~dp0VAE\Flux\clip_l.bat
call %~dp0VAE\Flux\t5xxl-Q5_K_M.bat
