@echo off
chcp 65001 > NUL

call %~dp0ControlNet\Pony\CN-anytest_v3-50000_pn_dim8.bat
call %~dp0ControlNet\Pony\CN-anytest_v3-50000_pn_dim64.bat
call %~dp0ControlNet\Pony\CN-anytest_v3-50000_pn_dim256.bat
call %~dp0ControlNet\Pony\CN-anytest_v4-marged_pn_dim64.bat
call %~dp0ControlNet\Pony\CN-anytest_v4-marged_pn_dim256.bat

call %~dp0ControlNet\Sdxl\CN-anytest_v3-50000_am_dim8.bat
call %~dp0ControlNet\Sdxl\CN-anytest_v3-50000_am_dim64.bat
call %~dp0ControlNet\Sdxl\CN-anytest_v3-50000_am_dim256.bat
call %~dp0ControlNet\Sdxl\CN-anytest_v4-marged_am_dim64.bat
call %~dp0ControlNet\Sdxl\CN-anytest_v4-marged_am_dim256.bat
call %~dp0ControlNet\Sdxl\cnlllite-anystyle_v3-step00005000.bat
call %~dp0ControlNet\Sdxl\Kataragi_inpaintXL-lora128.bat
call %~dp0ControlNet\Sdxl\TTPLANET_Controlnet_Tile_realistic_v2_rank256.bat

call %~dp0ESRGAN.bat

call %~dp0Lora\Sdxl\Hyper-SDXL-8steps-lora.bat

call %~dp0Stable-diffusion\Pony\ebara_pony_2.1.bat
call %~dp0Stable-diffusion\Sdxl\animagine-xl-3.1.bat

call %~dp0VAE\Sdxl\sdxl_vae.bat
