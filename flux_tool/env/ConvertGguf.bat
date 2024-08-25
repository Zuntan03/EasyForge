@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\setup\download\HuggingFace.bat
set "CONVERT_EXE=%~dp0convert.exe"
set "LLAMA_QUANTIZE_EXE=%~dp0llama-quantize.exe"

set "CONVERT_GGUF_MSG=Converting *.safetensor model to *.gguf model. Please wait."
if "%LANG_TAG%" == "ja" (
	set "CONVERT_GGUF_MSG=*.safetensor 形式のモデルを *.gguf 形式のモデルに変換します。しばらくお待ちください。"
)
echo %CONVERT_GGUF_MSG%

@REM https://huggingface.co/Zuntan/dist
call %DL_HF% "%~dp0" convert.exe Zuntan/dist
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %DL_HF% "%~dp0" llama-quantize.exe Zuntan/dist
if %ERRORLEVEL% neq 0 ( exit /b 1 )

set "SAFETENSOR_MODEL=%~1"
set "SAFETENSOR_MODEL_DIR_NAME=%~dpn1"

set "GGUF_ORIGINAL_MODEL=%SAFETENSOR_MODEL_DIR_NAME%.gguf"
echo "%CONVERT_EXE%" --src "%SAFETENSOR_MODEL%" --dst "%GGUF_ORIGINAL_MODEL%"
"%CONVERT_EXE%" --src "%SAFETENSOR_MODEL%" --dst "%GGUF_ORIGINAL_MODEL%"
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )

:QUANTIZE_LOOP
set "QUANTIZE=%~2"
if "%QUANTIZE%" == "" goto QUANTIZE_END

echo "%LLAMA_QUANTIZE_EXE%" "%GGUF_ORIGINAL_MODEL%" "%SAFETENSOR_MODEL_DIR_NAME%-%QUANTIZE%.gguf" %QUANTIZE%
"%LLAMA_QUANTIZE_EXE%" "%GGUF_ORIGINAL_MODEL%" "%SAFETENSOR_MODEL_DIR_NAME%-%QUANTIZE%.gguf" %QUANTIZE%
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )

shift
goto QUANTIZE_LOOP

:QUANTIZE_END
echo del /Q "%GGUF_ORIGINAL_MODEL%"
del /Q "%GGUF_ORIGINAL_MODEL%"
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
