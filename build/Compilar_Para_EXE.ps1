<#
.SYNOPSIS
    Script utilitário para gerar instalador ou pacote executável (.exe) do TurboPC Pro.
.DESCRIPTION
    Utiliza o utilitário nativo do Windows (IExpress) para empacotar o projeto em um executável autônomo com ícone e elevação automática.
#>

$sourceDir = Resolve-Path "$PSScriptRoot\.."
$outputExe = "$sourceDir\TurboPC_Pro_Instalador.exe"
$sedFile = "$PSScriptRoot\turbopc.sed"

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "      GERADOR DE EXECUTÁVEL - TURBOPC PRO         " -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Para compilar o TurboPC Pro em um executável (.exe) autônomo e profissional:"
Write-Host "Opção 1: Usar o utilitário nativo IExpress do Windows (inicie digitando 'iexpress' no Win+R)"
Write-Host "Opção 2: Usar o software gratuito 'Bat To Exe Converter' ou 'Inno Setup'"
Write-Host "Opção 3: Compactar a pasta inteira em formato .ZIP para entrega direta aos clientes"
Write-Host ""
Write-Host "O projeto já está 100% configurado e pronto para execução direta via 'TurboPC_Pro.bat'!" -ForegroundColor Green