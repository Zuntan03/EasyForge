@echo off
chcp 65001 > NUL

call %~dp0all\ESRGAN.bat

call %~dp0ComfyUI\llm_gguf\Llama-3.1-8B-EZO-1.1-it-Q4_K_M.bat

call %~dp0Lora\FluxD-Util\Hyper-FLUX.1-dev-8steps-lora.bat

call %~dp0Stable-diffusion\FluxD-Anime\fca_style-v33-x10-8step-Q4_K_S.bat
call %~dp0Stable-diffusion\FluxD-Anime\MythP0rt-x08-8step-Q4_K_S.bat

call %~dp0Stable-diffusion\FluxD-Base\flux1-dev-hyper8-Q4_K_S.bat
call %~dp0Stable-diffusion\FluxD-Base\flux1-dev-hyper8-Q6_K.bat
call %~dp0Stable-diffusion\FluxD-Base\flux1-dev-hyper8-Q8_0.bat

call %~dp0Stable-diffusion\FluxD-Nsfw\iNiverseFluxV11-8step-Q4_K_S.bat
call %~dp0Stable-diffusion\FluxD-Nsfw\iNiverseV11x05-FCAnimeV33x05-8step-Q4_K_S.bat

call %~dp0VAE\Flux\ae.bat
call %~dp0VAE\Flux\clip_l.bat
call %~dp0VAE\Flux\t5xxl-Q6_K.bat
call %~dp0VAE\Flux\t5xxl_fp16.bat
