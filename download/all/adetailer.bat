@echo off
chcp 65001 > NUL
call %~dp0RecursiveBatCall.bat "%~dp0..\adetailer"
