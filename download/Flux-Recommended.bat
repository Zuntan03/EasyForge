@echo off
chcp 65001 > NUL

call %~dp0Flux-Minimum.bat

for /r "adetailer" %%i in (*.bat) do ( call "%%i" )

call %~dp0Stable-diffusion\Flux\flux1-dev-bnb-nf4-v2.bat
call %~dp0Stable-diffusion\Flux\fluxunchainedArtfulNSFW_fuT58x8E4m3fnV11.bat
call %~dp0Stable-diffusion\Flux\fluxunchainedArtfulNSFW_fuT516xfp8E4m3fnV11.bat

call %~dp0VAE\Flux\t5xxl_fp8_e4m3fn.bat
