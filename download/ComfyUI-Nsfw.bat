@echo off
chcp 65001 > NUL

call %~dp0ComfyUI-Minimum.bat

call %~dp0ComfyUI\llm_gguf\Vecteus-v1-Q4_K_M.bat

call %~dp0Stable-diffusion\FluxD-Nsfw\iNiverseFluxV11-8step-Q4_K_S.bat
call %~dp0Stable-diffusion\FluxD-Nsfw\iNiverseV11x05-FCAnimeV33x05-8step-Q4_K_S.bat
