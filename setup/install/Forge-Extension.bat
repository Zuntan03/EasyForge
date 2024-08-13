@echo off
chcp 65001 > NUL
pushd %~dp0..\..\stable-diffusion-webui-forge\extensions
set GITHUB=%~dp0..\git\GitHub-CloneOrPull.bat

@REM https://github.com/DominikDoom/a1111-sd-webui-tagcomplete
call %GITHUB% DominikDoom a1111-sd-webui-tagcomplete main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/licyk/advanced_euler_sampler_extension
call %GITHUB% licyk advanced_euler_sampler_extension main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM @REM https://github.com/mix1009/model-keyword
@REM call %GITHUB% mix1009 model-keyword main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/adieyal/sd-dynamic-prompts
call %GITHUB% adieyal sd-dynamic-prompts main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/hinablue/sd-forge-adetailer
call %GITHUB% hinablue sd-forge-adetailer main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM @REM https://github.com/BlafKing/sd-civitai-browser-plus
@REM call %GITHUB% BlafKing sd-civitai-browser-plus main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM @REM https://github.com/Haoming02/sd-forge-couple
@REM call %GITHUB% Haoming02 sd-forge-couple main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/layerdiffusion/sd-forge-layerdiffuse
call %GITHUB% layerdiffusion sd-forge-layerdiffuse main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/blue-pen5805/sdweb-easy-generate-forever
call %GITHUB% blue-pen5805 sdweb-easy-generate-forever master
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM @REM https://github.com/hako-mikan/sd-webui-cd-tuner
@REM call %GITHUB% hako-mikan sd-webui-cd-tuner main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM @REM https://github.com/hako-mikan/sd-webui-lora-block-weight
@REM call %GITHUB% hako-mikan sd-webui-lora-block-weight main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM @REM https://github.com/hako-mikan/sd-webui-negpip
@REM call %GITHUB% hako-mikan sd-webui-negpip main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM @REM https://github.com/hako-mikan/sd-webui-regional-prompter
@REM call %GITHUB% hako-mikan sd-webui-regional-prompter main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM @REM https://github.com/nihedon/sd-webui-weight-helper
@REM call %GITHUB% nihedon sd-webui-weight-helper main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper/issues/300
@REM https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper
@REM call %GITHUB% butaixianran Stable-Diffusion-Webui-Civitai-Helper master
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper
call %GITHUB% zixaphir Stable-Diffusion-Webui-Civitai-Helper master
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )


@REM echo git -C Stable-Diffusion-Webui-Civitai-Helper fetch origin pull/124/head:Gradio4
@REM git -C Stable-Diffusion-Webui-Civitai-Helper fetch origin pull/124/head:Gradio4
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper/pull/124
echo git -C Stable-Diffusion-Webui-Civitai-Helper switch -C Gradio4 a607cd94ab65ea0433a43cbbfb91be76d0cae8f0
git -C Stable-Diffusion-Webui-Civitai-Helper switch -C Gradio4 a607cd94ab65ea0433a43cbbfb91be76d0cae8f0
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM https://github.com/L4Ph/stable-diffusion-webui-localization-ja_JP
call %GITHUB% L4Ph stable-diffusion-webui-localization-ja_JP main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM @REM https://github.com/Bocchi-Chan2023/stable-diffusion-webui-wd14-tagger 
@REM call %GITHUB% Bocchi-Chan2023 stable-diffusion-webui-wd14-tagger master
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/KohakuBlueleaf/z-a1111-sd-webui-dtg
call %GITHUB% KohakuBlueleaf z-a1111-sd-webui-dtg main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\stable-diffusion-webui-forge\extensions
