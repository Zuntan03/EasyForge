@echo off
chcp 65001 > NUL

call %~dp0Flux-Minimum.bat

call %~dp0all\adetailer.bat
call %~dp0all\wildcards.bat

call %~dp0Lora\FluxD-Util\Hyper-FLUX.1-dev-8steps-lora.bat

call %~dp0Stable-diffusion\FluxD-Base\flux1-dev-Q8_0.bat

call %~dp0Stable-diffusion\FluxD-Nsfw\FluxDev8AnimeNsfw-Q8_0.bat
