@echo off
chcp 65001 > NUL

call %~dp0Flux-Recommended.bat

call %~dp0all\Stable-diffusion_FluxD.bat
call %~dp0all\Stable-diffusion_FluxDS.bat
call %~dp0all\Stable-diffusion_FluxS.bat

call %~dp0all\Lora_FluxD.bat

call %~dp0all\VAE_Flux.bat
