@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models

@REM https://huggingface.co/mmnga/Llama-3.1-8B-EZO-1.1-it-gguf
call %DL_HF% llm_gguf\ Llama-3.1-8B-EZO-1.1-it-Q4_K_M.gguf mmnga/Llama-3.1-8B-EZO-1.1-it-gguf
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models
