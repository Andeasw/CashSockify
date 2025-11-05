# 读取 PID 文件
$PidFile = "D:\Mihomo\mihomo.pid"

if (Test-Path $PidFile) {
    $pid = Get-Content $PidFile
    if (Get-Process -Id $pid -ErrorAction SilentlyContinue) {
        Stop-Process -Id $pid
        Write-Host "Mihomo 已停止，PID: $pid"
    } else {
        Write-Host "未找到正在运行的 Mihomo 进程"
    }
    Remove-Item $PidFile
} else {
    Write-Host "PID 文件不存在，可能 Mihomo 没有启动"
}
