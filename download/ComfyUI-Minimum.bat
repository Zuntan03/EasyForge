@echo off
chcp 65001 > NUL

call %~dp0adetailer\bbox\face_yolov8m.bat
call %~dp0adetailer\bbox\face_yolov9c.bat
call %~dp0adetailer\bbox\foot_yolov8x_v2.bat
call %~dp0adetailer\bbox\hand_yolov8s.bat
call %~dp0adetailer\bbox\hand_yolov9c.bat

call %~dp0adetailer\segm\AnzhcBreasts-v1-1024.bat
call %~dp0adetailer\segm\AnzhcEyes-seg.bat
call %~dp0adetailer\segm\AnzhcFace-v2-640-seg.bat
call %~dp0adetailer\segm\AnzhcFace-v2-768MS-seg.bat
call %~dp0adetailer\segm\AnzhcFace-v2-1024-seg.bat
call %~dp0adetailer\segm\AnzhcHead-seg.bat
call %~dp0adetailer\segm\AnzhcHeadHair-seg.bat
call %~dp0adetailer\segm\person_yolov8m-seg.bat
call %~dp0adetailer\segm\PitHandDetailer.bat

call %~dp0all\ESRGAN.bat

call %~dp0ComfyUI\llm_gguf\Llama-3.1-8B-EZO-1.1-it-Q4_K_M.bat

call %~dp0Lora\FluxD-Util\Hyper-FLUX.1-dev-8steps-lora.bat

call %~dp0Stable-diffusion\FluxD-Anime\fca_style-v33-x10-8step-Q4_K_S.bat
call %~dp0Stable-diffusion\FluxD-Anime\MythP0rt-x08-8step-Q4_K_S.bat
call %~dp0Stable-diffusion\FluxD-Anime\waiAniFlux_v10-x05-8step-Q4_K_S.bat

call %~dp0Stable-diffusion\FluxD-Base\flux1-dev-hyper8-Q4_K_S.bat

call %~dp0VAE\Flux\ae.bat
call %~dp0VAE\Flux\clip_l.bat
call %~dp0VAE\Flux\t5xxl-Q6_K.bat
call %~dp0VAE\Flux\t5xxl_fp16.bat
