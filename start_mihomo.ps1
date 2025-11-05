# 获取当前脚本所在的目录
$PSScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition

# 构建要运行的脚本的完整路径
$targetScript = Join-Path -Path $PSScriptRoot -ChildPath "Start-Process.ps1"

# 使用隐藏窗口的方式启动脚本
Start-Process -FilePath "powershell.exe" -ArgumentList "-File `"$targetScript`"" -WindowStyle Hidden
