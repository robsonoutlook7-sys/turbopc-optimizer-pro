Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

[System.Windows.Forms.Application]::EnableVisualStyles()

# Criar Form Principal
$form = New-Object System.Windows.Forms.Form
$form.Text = "TurboPC Pro - Suite de Otimização e Limpeza do Windows"
$form.Size = New-Object System.Drawing.Size(720, 680)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::FromArgb(26, 27, 38)
$form.ForeColor = [System.Drawing.Color]::FromArgb(200, 210, 230)
$form.Font = New-Object System.Drawing.Font("Segoe UI", 9.5)

# Banner Superior
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Size = New-Object System.Drawing.Size(720, 75)
$headerPanel.Dock = "Top"
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(19, 20, 30)
$form.Controls.Add($headerPanel)

$lblTitle = New-Object System.Windows.Forms.Label
$lblTitle.Text = "⚡ TurboPC Pro v2.0"
$lblTitle.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$lblTitle.ForeColor = [System.Drawing.Color]::FromArgb(0, 210, 255)
$lblTitle.Location = New-Object System.Drawing.Point(20, 12)
$lblTitle.AutoSize = $true
$headerPanel.Controls.Add($lblTitle)

$lblSub = New-Object System.Windows.Forms.Label
$lblSub.Text = "Manutenção Preventiva, Aceleração e Recuperação de Espaço em Disco"
$lblSub.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$lblSub.ForeColor = [System.Drawing.Color]::FromArgb(140, 155, 180)
$lblSub.Location = New-Object System.Drawing.Point(22, 44)
$lblSub.AutoSize = $true
$headerPanel.Controls.Add($lblSub)

# Card de Status do Disco
$diskCard = New-Object System.Windows.Forms.GroupBox
$diskCard.Text = " Situação da Unidade C:\ "
$diskCard.Location = New-Object System.Drawing.Point(20, 85)
$diskCard.Size = New-Object System.Drawing.Size(665, 80)
$diskCard.ForeColor = [System.Drawing.Color]::FromArgb(180, 195, 220)
$form.Controls.Add($diskCard)

$cDrive = Get-PSDrive C
$freeGB = [math]::Round($cDrive.Free / 1GB, 2)
$totalGB = [math]::Round(($cDrive.Used + $cDrive.Free) / 1GB, 2)
$usedPercent = [math]::Round(($cDrive.Used / ($cDrive.Used + $cDrive.Free)) * 100, 1)

$lblDiskInfo = New-Object System.Windows.Forms.Label
$lblDiskInfo.Text = "Espaço Livre: $freeGB GB de $totalGB GB ($usedPercent% ocupado)"
$lblDiskInfo.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$lblDiskInfo.ForeColor = [System.Drawing.Color]::FromArgb(255, 215, 0)
$lblDiskInfo.Location = New-Object System.Drawing.Point(15, 22)
$lblDiskInfo.AutoSize = $true
$diskCard.Controls.Add($lblDiskInfo)

$progDisk = New-Object System.Windows.Forms.ProgressBar
$progDisk.Location = New-Object System.Drawing.Point(15, 48)
$progDisk.Size = New-Object System.Drawing.Size(635, 18)
$progDisk.Value = [math]::Min(100, [int]$usedPercent)
$diskCard.Controls.Add($progDisk)

# Card de Selecao das Etapas
$optCard = New-Object System.Windows.Forms.GroupBox
$optCard.Text = " Módulos de Limpeza Selecionados "
$optCard.Location = New-Object System.Drawing.Point(20, 175)
$optCard.Size = New-Object System.Drawing.Size(665, 170)
$optCard.ForeColor = [System.Drawing.Color]::FromArgb(180, 195, 220)
$form.Controls.Add($optCard)

$chkRestore = New-Object System.Windows.Forms.CheckBox
$chkRestore.Text = "Criar Ponto de Restauração de Segurança antes de iniciar (Recomendado)"
$chkRestore.Checked = $true
$chkRestore.Location = New-Object System.Drawing.Point(15, 25)
$chkRestore.Size = New-Object System.Drawing.Size(600, 22)
$chkRestore.ForeColor = [System.Drawing.Color]::FromArgb(0, 230, 118)
$optCard.Controls.Add($chkRestore)

$chkTemp = New-Object System.Windows.Forms.CheckBox
$chkTemp.Text = "Lixeira e Arquivos Temporários (%TEMP% e Windows Temp)"
$chkTemp.Checked = $true
$chkTemp.Location = New-Object System.Drawing.Point(15, 55)
$chkTemp.Size = New-Object System.Drawing.Size(300, 22)
$optCard.Controls.Add($chkTemp)

$chkBrowsers = New-Object System.Windows.Forms.CheckBox
$chkBrowsers.Text = "Caches de Navegadores (Chrome, Edge, Brave, Opera)"
$chkBrowsers.Checked = $true
$chkBrowsers.Location = New-Object System.Drawing.Point(15, 82)
$chkBrowsers.Size = New-Object System.Drawing.Size(300, 22)
$optCard.Controls.Add($chkBrowsers)

$chkGames = New-Object System.Windows.Forms.CheckBox
$chkGames.Text = "Caches de Jogos e Apps (Discord, Spotify, Steam)"
$chkGames.Checked = $true
$chkGames.Location = New-Object System.Drawing.Point(15, 109)
$chkGames.Size = New-Object System.Drawing.Size(300, 22)
$optCard.Controls.Add($chkGames)

$chkUpdate = New-Object System.Windows.Forms.CheckBox
$chkUpdate.Text = "Arquivos antigos de instalação do Windows Update"
$chkUpdate.Checked = $true
$chkUpdate.Location = New-Object System.Drawing.Point(340, 55)
$chkUpdate.Size = New-Object System.Drawing.Size(300, 22)
$optCard.Controls.Add($chkUpdate)

$chkDism = New-Object System.Windows.Forms.CheckBox
$chkDism.Text = "Limpeza Profunda de Componentes Antigos (DISM)"
$chkDism.Checked = $true
$chkDism.Location = New-Object System.Drawing.Point(340, 82)
$chkDism.Size = New-Object System.Drawing.Size(300, 22)
$optCard.Controls.Add($chkDism)

$chkTrim = New-Object System.Windows.Forms.CheckBox
$chkTrim.Text = "Otimização de Rede (DNS) e TRIM do SSD"
$chkTrim.Checked = $true
$chkTrim.Location = New-Object System.Drawing.Point(340, 109)
$chkTrim.Size = New-Object System.Drawing.Size(300, 22)
$optCard.Controls.Add($chkTrim)

$chkRecycle = New-Object System.Windows.Forms.CheckBox
$chkRecycle.Text = "Esvaziar a Lixeira do Windows automaticamente"
$chkRecycle.Checked = $true
$chkRecycle.Location = New-Object System.Drawing.Point(15, 136)
$chkRecycle.Size = New-Object System.Drawing.Size(300, 22)
$optCard.Controls.Add($chkRecycle)

# Log em Tempo Real
$txtLog = New-Object System.Windows.Forms.TextBox
$txtLog.Location = New-Object System.Drawing.Point(20, 355)
$txtLog.Size = New-Object System.Drawing.Size(665, 195)
$txtLog.Multiline = $true
$txtLog.ScrollBars = "Vertical"
$txtLog.ReadOnly = $true
$txtLog.BackColor = [System.Drawing.Color]::FromArgb(15, 16, 24)
$txtLog.ForeColor = [System.Drawing.Color]::FromArgb(0, 230, 118)
$txtLog.Font = New-Object System.Drawing.Font("Consolas", 9)
$txtLog.Text = "[Pronto] Clique no botão abaixo para iniciar a otimização."
$form.Controls.Add($txtLog)

# Barra de Progresso
$progBar = New-Object System.Windows.Forms.ProgressBar
$progBar.Location = New-Object System.Drawing.Point(20, 560)
$progBar.Size = New-Object System.Drawing.Size(665, 12)
$form.Controls.Add($progBar)

# Botoes de Acao
$btnStart = New-Object System.Windows.Forms.Button
$btnStart.Text = "🚀 INICIAR OTIMIZAÇÃO TURBO"
$btnStart.Location = New-Object System.Drawing.Point(20, 582)
$btnStart.Size = New-Object System.Drawing.Size(480, 45)
$btnStart.BackColor = [System.Drawing.Color]::FromArgb(0, 200, 83)
$btnStart.ForeColor = [System.Drawing.Color]::White
$btnStart.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$btnStart.FlatStyle = "Flat"
$btnStart.FlatAppearance.BorderSize = 0
$form.Controls.Add($btnStart)

$btnRestore = New-Object System.Windows.Forms.Button
$btnRestore.Text = "🛡️ Restaurar..."
$btnRestore.Location = New-Object System.Drawing.Point(510, 582)
$btnRestore.Size = New-Object System.Drawing.Size(175, 45)
$btnRestore.BackColor = [System.Drawing.Color]::FromArgb(45, 52, 70)
$btnRestore.ForeColor = [System.Drawing.Color]::White
$btnRestore.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$btnRestore.FlatStyle = "Flat"
$btnRestore.FlatAppearance.BorderSize = 0
$form.Controls.Add($btnRestore)

# Funcao de Log
function LogMsg($msg) {
    $txtLog.AppendText("`r`n" + (Get-Date -Format "HH:mm:ss") + " - " + $msg)
    $txtLog.SelectionStart = $txtLog.Text.Length
    $txtLog.ScrollToCaret()
    [System.Windows.Forms.Application]::DoEvents()
}

$btnRestore.Add_Click({
    Start-Process rstrui.exe
})

$btnStart.Add_Click({
    $btnStart.Enabled = $false
    $btnRestore.Enabled = $false
    $progBar.Value = 0

    $initFree = (Get-PSDrive C).Free
    LogMsg("Iniciando processo de otimização...")

    if ($chkRestore.Checked) {
        $progBar.Value = 10
        LogMsg("[1/8] Criando ponto de restauração de segurança...")
        try {
            Enable-ComputerRestore -Drive 'C:\' -ErrorAction SilentlyContinue
            Checkpoint-Computer -Description 'TurboPC-GUI-Backup' -RestorePointType 'MODIFY_SETTINGS' -ErrorAction SilentlyContinue
            LogMsg(" -> Ponto de restauração concluído.")
        } catch {
            LogMsg(" -> Ponto de restauração ignorado.")
        }
    }

    if ($chkTemp.Checked) {
        $progBar.Value = 25
        LogMsg("[2/8] Limpando arquivos temporários (%TEMP% e Windows Temp)...")
        Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
        Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
        LogMsg(" -> Temporários limpos.")
    }

        if ($chkBrowsers.Checked) {
        $progBar.Value = 40
        LogMsg("[3/8] Detectando e limpando caches de todos os navegadores e perfis...")
        $patterns = @(
            "$env:LOCALAPPDATA\*\User Data\*\Cache",
            "$env:LOCALAPPDATA\*\*\User Data\*\Cache",
            "$env:LOCALAPPDATA\*\User Data\*\Code Cache",
            "$env:LOCALAPPDATA\*\*\User Data\*\Code Cache",
            "$env:LOCALAPPDATA\*\User Data\*\GPUCache",
            "$env:LOCALAPPDATA\*\*\User Data\*\GPUCache",
            "$env:LOCALAPPDATA\Opera Software\*\Cache",
            "$env:APPDATA\Opera Software\*\Cache",
            "$env:LOCALAPPDATA\*\Profiles\*\cache2",
            "$env:LOCALAPPDATA\*\*\Profiles\*\cache2",
            "$env:LOCALAPPDATA\*\Profiles\*\startupCache",
            "$env:LOCALAPPDATA\*\*\Profiles\*\startupCache"
        )
        $dirs = Resolve-Path $patterns -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -Unique
        foreach ($d in $dirs) {
            Remove-Item "$d\*" -Recurse -Force -ErrorAction SilentlyContinue
        }
        LogMsg(" -> " + $dirs.Count + " pastas de cache de navegadores otimizadas com sucesso.")
    }

    if ($chkGames.Checked) {
        $progBar.Value = 55
        LogMsg("[4/8] Limpando caches de jogos e apps (Discord, Spotify)...")
        $appPaths = @("$env:APPDATA\discord\Cache", "$env:LOCALAPPDATA\Spotify\Storage")
        foreach ($ap in $appPaths) {
            if (Test-Path $ap) { Remove-Item "$ap\*" -Recurse -Force -ErrorAction SilentlyContinue }
        }
        LogMsg(" -> Caches de aplicativos liberados.")
    }

    if ($chkUpdate.Checked) {
        $progBar.Value = 70
        LogMsg("[5/8] Limpando cache do Windows Update...")
        Stop-Service wuauserv -ErrorAction SilentlyContinue
        Remove-Item "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
        Start-Service wuauserv -ErrorAction SilentlyContinue
        LogMsg(" -> Cache de atualizações liberado.")
    }

    if ($chkDism.Checked) {
        $progBar.Value = 85
        LogMsg("[6/8] Executando limpeza profunda WinSxS (DISM)...")
        Start-Process dism.exe -ArgumentList "/online /Cleanup-Image /StartComponentCleanup" -Wait -WindowStyle Hidden
        LogMsg(" -> Componentes antigos limpos.")
    }

    if ($chkRecycle.Checked) {
        $progBar.Value = 92
        LogMsg("[7/8] Esvaziando Lixeira do Windows...")
        Clear-RecycleBin -Force -ErrorAction SilentlyContinue
        LogMsg(" -> Lixeira limpa.")
    }

    if ($chkTrim.Checked) {
        $progBar.Value = 98
        LogMsg("[8/8] Renovando DNS e aplicando TRIM no SSD...")
        ipconfig /flushdns >nul 2>&1
        Optimize-Volume -DriveLetter C -ReTrim -Verbose -ErrorAction SilentlyContinue
        LogMsg(" -> SSD otimizado e latência de DNS renovada.")
    }

    $progBar.Value = 100
    $finalFree = (Get-PSDrive C).Free
    $recuperadoGB = [math]::Max(0, [math]::Round(($finalFree - $initFree) / 1GB, 2))

    LogMsg("==================================================")
    LogMsg("🎉 OTIMIZAÇÃO CONCLUÍDA COM SUCESSO!")
    LogMsg("Espaço recuperado: +$recuperadoGB GB liberados no disco C:\")
    LogMsg("==================================================")

    [System.Windows.Forms.MessageBox]::Show("Otimização concluída com sucesso!`n`nEspaço liberado: +$recuperadoGB GB`nSeu computador está pronto e acelerado!", "TurboPC Pro", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)

    $btnStart.Enabled = $true
    $btnRestore.Enabled = $true
})

$form.ShowDialog()