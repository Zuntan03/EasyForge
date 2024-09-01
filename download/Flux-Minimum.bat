@echo off
chcp 65001 > NUL

call %~dp0all\ESRGAN.bat

call %~dp0Stable-diffusion\FluxD-Base\flux1-dev-hyper8-Q4_K_S.bat
call %~dp0Stable-diffusion\FluxD-Base\flux1-dev-hyper8-Q8_0.bat

call %~dp0VAE\Flux\ae.bat
call %~dp0VAE\Flux\clip_l.bat
call %~dp0VAE\Flux\t5xxl-Q6_K.bat
call %~dp0VAE\Flux\t5xxl_fp16.bat
