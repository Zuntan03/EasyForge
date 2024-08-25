@echo off
chcp 65001 > NUL

set "MERGE_MODEL_LORA_WAIT=LoRA merging may take a few minutes. Please wait."
if "%LANG_TAG%" == "ja" (
	set "MERGE_MODEL_LORA_WAIT=LoRA のマージに数分かかる場合があります。しばらくお待ちください。"
)

set "FLUX_MODEL_OPTION="
if not "%FLUX_MODEL%" == "" (
	set "FLUX_MODEL_OPTION=--flux_model ""%FLUX_MODEL%"""
)

echo %MERGE_LORA% %FLUX_MODEL_OPTION% --save_to "%SAVE_TO%" --models "%FLUX_LORA%" --ratios %FLUX_LORA_WEIGHT% %MERGE_LORA_OPTION% %*
echo %MERGE_MODEL_LORA_WAIT%
%MERGE_LORA% %FLUX_MODEL_OPTION% --save_to "%SAVE_TO%" --models "%FLUX_LORA%" --ratios %FLUX_LORA_WEIGHT% %MERGE_LORA_OPTION% %*
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )

exit /b 0

set "MERGE_LORA_LOG=%~dp0MergeLoraLog.txt"
echo %MERGE_LORA% %FLUX_MODEL_OPTION% --save_to "%SAVE_TO%" --models "%FLUX_LORA%" --ratios %FLUX_LORA_WEIGHT% %MERGE_LORA_OPTION% %*
echo %MERGE_MODEL_LORA_WAIT%
%MERGE_LORA% %FLUX_MODEL_OPTION% --save_to "%SAVE_TO%" --models "%FLUX_LORA%" --ratios %FLUX_LORA_WEIGHT% %MERGE_LORA_OPTION% %* > "%MERGE_LORA_LOG%" 2>&1
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )

set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
%PS_CMD% -c "(gc '%MERGE_LORA_LOG%') -clike '*Unused keys in LoRA model:*'; if ($?) { exit 1 } exit 0"
if %ERRORLEVEL% equ 0 ( exit /b 0 )

echo %MERGE_LORA% %FLUX_MODEL_OPTION% --save_to "%SAVE_TO%" --models "%FLUX_LORA%" --ratios %FLUX_LORA_WEIGHT% %MERGE_LORA_OPTION% %* --diffusers
%MERGE_LORA% %FLUX_MODEL_OPTION% --save_to "%SAVE_TO%" --models "%FLUX_LORA%" --ratios %FLUX_LORA_WEIGHT% %MERGE_LORA_OPTION% %* --diffusers
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
