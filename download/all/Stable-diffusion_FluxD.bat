@echo off
chcp 65001 > NUL
for /d %%d in ("%~dp0..\Stable-diffusion\FluxD-*") do ( call %~dp0RecursiveBatCall.bat %%d )
for /d %%d in ("%~dp0..\Lora\FluxD-*") do ( call %~dp0RecursiveBatCall.bat %%d )
