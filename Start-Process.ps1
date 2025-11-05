# ----------------- 配置 -----------------
$MihomoPath = "D:\Mihomo\mihomo.exe"
$ConfigFile = "D:\Mihomo\socks.yaml"
$LogDir     = "D:\Mihomo\logs"
$PidFile    = "D:\Mihomo\mihomo.pid"   # 存储 PID
# -----------------------------------------

# 创建日志目录
if (-not (Test-Path $LogDir)) { New-Item -Path $LogDir -ItemType Directory | Out-Null }

# 日志文件名
$timestamp = (Get-Date).ToString("yyyy-MM-dd_HH-mm-ss")
$logFile = Join-Path $LogDir ("mihomo-$timestamp.log")

Write-Host "隐藏启动 Mihomo..."
Write-Host "日志文件: $logFile"

# 启动 Mihomo（隐藏窗口）并保存 PID
$process = Start-Process -FilePath $MihomoPath -ArgumentList "-f `"$ConfigFile`"" `
    -WindowStyle Hidden -PassThru

# 保存 PID 以便关闭
$process.Id | Out-File -FilePath $PidFile -Encoding ASCII

Write-Host "`nMihomo 已隐藏启动，PID: $($process.Id)"
Write-Host "关闭方法：运行 stop-mihomo.ps1 脚本即可停止"

