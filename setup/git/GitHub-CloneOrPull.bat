@echo off
chcp 65001 > NUL

set GITHUB_NAME=%1
set GITHUB_PRODUCT=%2
set GITHUB_BRANCH=%3
set GITHUB_HASH=%4

call %~dp0Git-CloneOrPull.bat https://github.com/%GITHUB_NAME%/%GITHUB_PRODUCT% %GITHUB_BRANCH%
if %ERRORLEVEL% neq 0 ( exit /b 1 )

if "%GITHUB_HASH%"=="" ( exit /b 0 )

set GITHUB_HASH_BRANCH=%GITHUB_HASH:~0,7%
echo git -C %GITHUB_PRODUCT% switch -C %GITHUB_HASH_BRANCH% %GITHUB_HASH%
git -C %GITHUB_PRODUCT% switch -C %GITHUB_HASH_BRANCH% %GITHUB_HASH%
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )

exit /b 0
