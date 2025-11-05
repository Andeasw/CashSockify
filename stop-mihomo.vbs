' ==========================================================
' ==  Mihomo 单文件静默停止脚本 (stop-mihomo.vbs)
' ==  双击此文件即可无窗口停止 Mihomo
' ==========================================================

' 定义要停止的进程的文件名
Dim processName
processName = "mihomo-windows-amd64-v1.exe"

' 创建一个 Shell 对象，用于执行命令
Set objShell = CreateObject("Shell.Application")

' 拼接出完整的命令行指令
' /c     告诉 cmd.exe 执行完命令后就关闭
' taskkill 是执行停止操作的命令
' /F     是强制停止
' /IM    是通过镜像名 (也就是文件名) 来指定目标
Dim command
command = "/c taskkill /F /IM " & processName

' 以管理员权限("runas")、用隐藏窗口("0")的方式，执行我们的命令
' 这是整个脚本的核心
objShell.ShellExecute "cmd.exe", command, "", "runas", 0

