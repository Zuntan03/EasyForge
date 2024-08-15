@echo off
chcp 65001 > NUL

call %~dp0Stable-diffusion\Flux\flux1-dev-Q4_0.bat
call %~dp0Stable-diffusion\Flux\flux1-dev-Q5_0.bat
call %~dp0Stable-diffusion\Flux\flux1-dev-Q8_0.bat
call %~dp0Stable-diffusion\Flux\flux1-schnell-Q4_0.bat
call %~dp0Stable-diffusion\Flux\flux1-schnell-Q5_0.bat
call %~dp0Stable-diffusion\Flux\flux1-schnell-Q8_0.bat

call %~dp0VAE\Flux\ae.bat
call %~dp0VAE\Flux\clip_l.bat
call %~dp0VAE\Flux\t5xxl_fp8_e4m3fn.bat
call %~dp0VAE\Flux\t5xxl_fp16.bat
