@echo off
setlocal
title TurboPC Pro - Criar Ponto de Restauracao
color 0A

fsutil dirty query %systemdrive% >nul 2>&1
if %errorlevel% neq 0 (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process cmd.exe -ArgumentList '/c \"\"%~f0\"\"' -Verb RunAs"
    exit /b
)

cls
echo ===============================================================================
echo          TURBOPC PRO - CRIACAO DE PONTO DE RESTAURACAO DO WINDOWS
echo ===============================================================================
echo.
echo Criando ponto de restauracao de seguranca... Aguarde alguns segundos.
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "Enable-ComputerRestore -Drive 'C:\' -ErrorAction SilentlyContinue; Checkpoint-Computer -Description 'TurboPC-Ponto-Manual' -RestorePointType 'MODIFY_SETTINGS'; Write-Host '`nPonto de Restauracao criado com sucesso!' -ForegroundColor Green"

echo.
echo ===============================================================================
echo Operacao concluida!
echo ===============================================================================
pause
exit /b