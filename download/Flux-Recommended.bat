@echo off
chcp 65001 > NUL

call %~dp0Flux-Minimum.bat

call %~dp0all\adetailer.bat
call %~dp0all\wildcards.bat

call %~dp0Stable-diffusion\FluxD-Base\flux1-dev-bnb-nf4-v2.bat
call %~dp0Stable-diffusion\FluxD-Base\flux1-dev-Q8_0.bat

call %~dp0Stable-diffusion\FluxDS-Base\FluxFusionDS_v0_nf4.bat
call %~dp0Stable-diffusion\FluxDS-Base\FluxFusionDS_v0_Q8.bat

call %~dp0Stable-diffusion\FluxS-Base\flux1-schnell-Q8_0.bat

call %~dp0VAE\Flux\t5xxl_fp16.bat
call %~dp0VAE\Flux\t5xxl_fp8_e4m3fn.bat
