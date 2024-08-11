@echo off
chcp 65001 > NUL

call %~dp0ControlNet\Pony\CN-anytest_v3-50000_pn_dim8.bat
call %~dp0ControlNet\Pony\CN-anytest_v3-50000_pn_dim64.bat
call %~dp0ControlNet\Pony\CN-anytest_v3-50000_pn_dim256.bat
call %~dp0ControlNet\Pony\CN-anytest_v4-marged_pn_dim64.bat
call %~dp0ControlNet\Pony\CN-anytest_v4-marged_pn_dim256.bat

call %~dp0ControlNet\SDXL\CN-anytest_v3-50000_am_dim8.bat
call %~dp0ControlNet\SDXL\CN-anytest_v3-50000_am_dim64.bat
call %~dp0ControlNet\SDXL\CN-anytest_v3-50000_am_dim256.bat
call %~dp0ControlNet\SDXL\CN-anytest_v4-marged_am_dim64.bat
call %~dp0ControlNet\SDXL\CN-anytest_v4-marged_am_dim256.bat
call %~dp0ControlNet\SDXL\cnlllite-anystyle_v3-step00005000.bat
call %~dp0ControlNet\SDXL\Kataragi_inpaintXL-lora128.bat
call %~dp0ControlNet\SDXL\TTPLANET_Controlnet_Tile_realistic_v2_rank256.bat

call %~dp0ESRGAN\4x-AnimeSharp.bat
call %~dp0ESRGAN\4x-UltraSharp.bat

call %~dp0Lora\SDXL\Hyper-SDXL-8steps-lora.bat

call %~dp0Stable-diffusion\Pony\ebara_pony_2.1.bat
call %~dp0Stable-diffusion\SDXL\animagine-xl-3.1.bat

call %~dp0VAE\SDXL\sdxl_vae.bat
