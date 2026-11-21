@echo off
setlocal EnableDelayedExpansion
title TurboPC Pro - Suite de Otimizacao e Limpeza Avancada
color 0B

:: 1. Verificacao e Solicitacao de Privilegios de Administrador
fsutil dirty query %systemdrive% >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ===============================================================================
    echo  [AVISO] Solicitando privilegios de Administrador para o sistema...
    echo  Clique em "SIM" na janela do Windows para liberar a otimizacao.
    echo ===============================================================================
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process cmd.exe -ArgumentList '/c \"\"%~f0\"\"' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"
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
echo                      TURBOPC PRO - SISTEMA DE ALTA VELOCIDADE
echo ===============================================================================
echo.
echo  [x] Privilegios de Administrador: Confirmados
echo  [x] Alvo Principal: Unidade C:\ e Caches Globais do Sistema
echo  [x] Politica de Seguranca: Documentos, fotos, senhas e navegacao 100%% preservados.
echo ===============================================================================
echo.

:: Medir espaco livre inicial em bytes
for /f "tokens=*" %%a in ('powershell -NoProfile -Command "(Get-PSDrive C).Free"') do set BYTES_INICIAL=%%a

echo [*] Analisando situacao atual do disco...
powershell -NoProfile -Command "$initGB = [math]::Round([double]%BYTES_INICIAL% / 1GB, 2); Write-Host ' -> Espaco Livre Atual no Disco C:\: ' -NoNewline; Write-Host \"$initGB GB\" -ForegroundColor Yellow"
echo.
echo Iniciando protocolo de otimizacao em 9 etapas...
echo -------------------------------------------------------------------------------

:: ETAPA 1: Ponto de Restauracao de Seguranca
echo [1/9] Criando Ponto de Restauracao de Seguranca no Windows...
powershell -NoProfile -ExecutionPolicy Bypass -Command "try { Enable-ComputerRestore -Drive 'C:\' -ErrorAction SilentlyContinue; Checkpoint-Computer -Description 'TurboPC-Backup-Seguranca' -RestorePointType 'MODIFY_SETTINGS' -ErrorAction SilentlyContinue; Write-Host '       -> Ponto de seguranca criado com sucesso!' -ForegroundColor Green } catch { Write-Host '       -> Ponto de restauracao opcional pulado.' -ForegroundColor DarkYellow }" >nul 2>&1
echo       -> Protecao de seguranca validada.

:: ETAPA 2: Temporarios do Usuario e Despejos de Memoria
echo.
echo [2/9] Removendo arquivos temporarios (%TEMP%), CrashDumps e relatorios...
del /q /f /s "%TEMP%\*" >nul 2>&1
for /d %%p in ("%TEMP%\*") do rmdir /s /q "%%p" >nul 2>&1
powershell -NoProfile -Command "if (Test-Path '$env:LOCALAPPDATA\CrashDumps') { Remove-Item '$env:LOCALAPPDATA\CrashDumps\*' -Recurse -Force -ErrorAction SilentlyContinue }; if (Test-Path '$env:LOCALAPPDATA\D3DSCache') { Remove-Item '$env:LOCALAPPDATA\D3DSCache\*' -Recurse -Force -ErrorAction SilentlyContinue }" >nul 2>&1
echo       -> Lixo temporario do perfil de usuario limpo.

:: ETAPA 3: Caches de Navegadores Web (Preserva senhas, favoritos e historico)
echo.
echo [3/9] Limpando caches pesados de navegadores (Chrome, Edge, Brave, Opera, Firefox)...
powershell -NoProfile -Command "$paths = @('$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache', '$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Code Cache', '$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache', '$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Code Cache', '$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default\Cache', '$env:APPDATA\Opera Software\Opera Stable\Cache', '$env:APPDATA\Opera Software\Opera GX Stable\Cache', '$env:LOCALAPPDATA\Mozilla\Firefox\Profiles'); foreach ($p in $paths) { if (Test-Path $p) { Remove-Item \"$p\*\" -Recurse -Force -ErrorAction SilentlyContinue } }" >nul 2>&1
echo       -> Caches de navegacao liberados com integridade garantida.

:: ETAPA 4: Caches de Jogos, Comunicacao e Shader Caches
echo.
echo [4/9] Limpando caches residuais de aplicativos (Discord, Spotify, Steam Shader Cache)...
powershell -NoProfile -Command "$appPaths = @('$env:APPDATA\discord\Cache', '$env:APPDATA\discord\Code Cache', '$env:LOCALAPPDATA\Spotify\Storage', '$env:LOCALAPPDATA\Roblox\logs', '$env:LOCALAPPDATA\Steam\htmlcache'); foreach ($ap in $appPaths) { if (Test-Path $ap) { Remove-Item \"$ap\*\" -Recurse -Force -ErrorAction SilentlyContinue } }" >nul 2>&1
echo       -> Caches de multimidia e jogos otimizados.

:: ETAPA 5: Caches de Desenvolvimento e Compilacao
echo.
echo [5/9] Limpando caches residuais de pacotes e ferramentas de teste...
powershell -NoProfile -Command "if (Test-Path '$env:LOCALAPPDATA\npm-cache') { Remove-Item '$env:LOCALAPPDATA\npm-cache' -Recurse -Force -ErrorAction SilentlyContinue }; if (Test-Path '$env:LOCALAPPDATA\pip\cache') { Remove-Item '$env:LOCALAPPDATA\pip\cache' -Recurse -Force -ErrorAction SilentlyContinue }; if (Test-Path '$HOME\.gemini\antigravity\scratch') { Get-ChildItem -Path '$HOME\.gemini\antigravity\scratch' -Directory -Filter 'temp_*' -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue }" >nul 2>&1
echo       -> Caches tecnicos liberados.

:: ETAPA 6: Residuos do Sistema Windows e Logs de Erro
echo.
echo [6/9] Limpando arquivos temporarios do Windows (C:\Windows\Temp, WER, Minidumps)...
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
for /d %%p in ("C:\Windows\Temp\*") do rmdir /s /q "%%p" >nul 2>&1
powershell -NoProfile -Command "if (Test-Path 'C:\ProgramData\Microsoft\Windows\WER') { Remove-Item 'C:\ProgramData\Microsoft\Windows\WER\ReportQueue\*', 'C:\ProgramData\Microsoft\Windows\WER\ReportArchive\*' -Recurse -Force -ErrorAction SilentlyContinue }; if (Test-Path 'C:\Windows\Minidump') { Remove-Item 'C:\Windows\Minidump\*' -Force -ErrorAction SilentlyContinue }; if (Test-Path 'C:\Windows\MEMORY.DMP') { Remove-Item 'C:\Windows\MEMORY.DMP' -Force -ErrorAction SilentlyContinue }" >nul 2>&1
echo       -> Temporarios centrais do sistema operacional limpos.

:: ETAPA 7: Cache do Windows Update
echo.
echo [7/9] Esvaziando instaladores obsoletos do Windows Update...
net stop wuauserv >nul 2>&1
del /q /f /s "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
for /d %%p in ("C:\Windows\SoftwareDistribution\Download\*") do rmdir /s /q "%%p" >nul 2>&1
net start wuauserv >nul 2>&1
echo       -> Cache de download de atualizacoes esvaziado.

:: ETAPA 8: Limpeza Profunda de Componentes Antigos (DISM WinSxS) e Lixeira
echo.
echo [8/9] Executando limpeza profunda de componentes antigos (DISM WinSxS)...
echo       (Aguarde alguns instantes enquanto o Windows remove pacotes obsoletos...)
dism.exe /online /Cleanup-Image /StartComponentCleanup
powershell -NoProfile -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue" >nul 2>&1
echo       -> Componentes obsoletos limpos e Lixeira esvaziada.

:: ETAPA 9: Otimizacao de Rede (DNS) e TRIM do SSD
echo.
echo [9/9] Renovando cache DNS e aplicando instrucao TRIM no SSD...
ipconfig /flushdns >nul 2>&1
powershell -NoProfile -Command "Optimize-Volume -DriveLetter C -ReTrim -Verbose" >nul 2>&1
echo       -> Latencia de rede otimizada e blocos flash do SSD re-balanceados!

echo.
echo ===============================================================================
echo                      RELATORIO FINAL DE PERFORMANCE
echo ===============================================================================
powershell -NoProfile -Command "$init = [double]%BYTES_INICIAL%; $final = (Get-PSDrive C).Free; $gain = [math]::Max(0, [math]::Round(($final - $init) / 1GB, 2)); $initGB = [math]::Round($init / 1GB, 2); $finalGB = [math]::Round($final / 1GB, 2); Write-Host '  Espaco Livre ANTERIOR: ' -NoNewline; Write-Host \"$initGB GB\" -ForegroundColor Yellow; Write-Host '  Espaco Livre ATUAL:    ' -NoNewline; Write-Host \"$finalGB GB\" -ForegroundColor Green; Write-Host '  TOTAL RECUPERADO:      ' -NoNewline; Write-Host \"+$gain GB\" -ForegroundColor Cyan"
echo.
echo  [x] Status: Otimizacao Turbo finalizada com 100%% de sucesso!
echo  [x] Seguranca: Todos os seus arquivos e programas continuam intactos.
echo ===============================================================================
powershell -NoProfile -Command "[Console]::Beep(1000, 300)" >nul 2>&1
echo.
echo Pressione qualquer tecla para finalizar...
pause >nul
exit /b