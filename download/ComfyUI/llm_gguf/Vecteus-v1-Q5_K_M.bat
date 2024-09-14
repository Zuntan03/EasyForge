@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models

@REM https://huggingface.co/mmnga/Vecteus-v1-gguf
call %DL_HF% llm_gguf\ Vecteus-v1-Q5_K_M.gguf mmnga/Vecteus-v1-gguf
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models
