@echo off
setlocal EnableDelayedExpansion
title TurboPC Pro - Painel Central
color 0B

fsutil dirty query %systemdrive% >nul 2>&1
if %errorlevel% neq 0 (
    echo Solicitando privilegios de administrador...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process cmd.exe -ArgumentList '/c \"\"%~f0\"\"' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

:MENU
cls
echo ===============================================================================
echo   #######  #     #  ######   ######   #######  ######    #####   ######  ######   ####### 
echo      #     #     #  #     #  #     #  #     #  #     #  #     #  #     # #     #  #     # 
echo      #     #     #  #     #  #     #  #     #  #     #  #        #     # #     #  #     # 
echo      #     #     #  ######   ######   #     #  ######   #        ######  ######   #     # 
echo      #     #     #  #   #    #     #  #     #  #        #        #       #   #    #     # 
echo      #     #     #  #    #   #     #  #     #  #        #     #  #       #    #   #     # 
echo      #      #####   #     #  ######   #######  #         #####   #       #     #  ####### 
echo ===============================================================================
echo            TURBOPC PRO - SUITE DE LIMPEZA E OTIMIZACAO DO WINDOWS
echo                             Versao 2.0 Comercial
echo ===============================================================================
echo.
echo  Selecione a opcao desejada:
echo.
echo   [1] ?? Otimizacao Turbo Completa (9 Etapas - Maximo Desempenho)
echo   [2] ? Limpeza Rapida Express (Temporarios e Navegadores - 30s)
echo   [3] ??? Abrir Aplicativo Visual (Interface Grafica Dark Mode)
echo   [4] ??? Criar Ponto de Restauracao de Seguranca
echo   [5] ? Abrir Restauracao do Sistema Windows
echo   [6] ?? Abrir Manual do Usuario e Dicas
echo   [0] ? Sair
echo.
echo ===============================================================================
set /p OPCAO="Digite o numero da opcao e pressione Enter: "

if "%OPCAO%"=="1" goto COMPLETA
if "%OPCAO%"=="2" goto EXPRESS
if "%OPCAO%"=="3" goto GUI
if "%OPCAO%"=="4" goto PONTO
if "%OPCAO%"=="5" goto RESTAURA
if "%OPCAO%"=="6" goto MANUAL
if "%OPCAO%"=="0" exit /b
goto MENU

:COMPLETA
call "%~dp0scripts\TurboPC-Optimizer.bat"
goto MENU

:EXPRESS
cls
echo ===============================================================================
echo                       TURBOPC PRO - LIMPEZA EXPRESS
echo ===============================================================================
echo.
echo [1/3] Limpando arquivos temporarios (%TEMP%)...
del /q /f /s "%TEMP%\*" >nul 2>&1
echo [2/3] Limpando caches de navegadores web...
powershell -NoProfile -Command "$paths = @('$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache', '$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache', '$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default\Cache'); foreach ($p in $paths) { if (Test-Path $p) { Remove-Item \"$p\*\" -Recurse -Force -ErrorAction SilentlyContinue } }" >nul 2>&1
echo [3/3] Esvaziando a Lixeira...
powershell -NoProfile -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue" >nul 2>&1
echo.
echo Limpeza Express concluida com sucesso!
timeout /t 3 >nul
goto MENU

:GUI
start powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0app\TurboPC_GUI.ps1"
goto MENU

:PONTO
call "%~dp0scripts\Criar_Ponto_Restauracao.bat"
goto MENU

:RESTAURA
call "%~dp0scripts\Restaurar_Sistema.bat"
goto MENU

:MANUAL
start notepad "%~dp0docs\MANUAL_DO_USUARIO.md"
goto MENU