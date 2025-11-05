# ----------------- 配置 -----------------
$ScriptDir = $PSScriptRoot
$MihomoPath = Join-Path $ScriptDir "mihomo-windows-amd64-v1.exe"
$ConfigFile = Join-Path $ScriptDir "socks.yaml"
$LogDir     = Join-Path $ScriptDir "logs"
# -----------------------------------------

# 设置控制台 UTF-8
chcp 65001 > $null
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# 创建日志目录
if (-not (Test-Path $LogDir)) { New-Item -Path $LogDir -ItemType Directory | Out-Null }

# 日志文件名
$timestamp = (Get-Date).ToString("yyyy-MM-dd_HH-mm-ss")
$logFile = Join-Path $LogDir ("mihomo-$timestamp.log")

Write-Host "正在启动 Mihomo..."
Write-Host "日志文件: $logFile"

# 前台启动 Mihomo，并输出日志（控制台显示 + UTF-8 日志文件）
& $MihomoPath -f $ConfigFile 2>&1 | ForEach-Object {
    $_ | Out-File -FilePath $logFile -Encoding UTF8 -Append
    Write-Host $_
}

Write-Host "`nMihomo 已退出，日志保存在: $logFile"
Pause
