@echo off
chcp 65001 > NUL

echo %EXTRACT_LORA% --save_to "%SAVE_TO%" --model_tuned "%TUNED_MODEL%" --model_org "%ORG_MODEL%" --dim "%FLUX_LORA_DIM%" %EXTRACT_LORA_OPTION% %*
%EXTRACT_LORA% --save_to "%SAVE_TO%" --model_tuned "%TUNED_MODEL%" --model_org "%ORG_MODEL%" --dim "%FLUX_LORA_DIM%" %EXTRACT_LORA_OPTION% %*
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
