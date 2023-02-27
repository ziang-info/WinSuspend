# WinSuspend
The best shortcut way of Windows Suspend (NOT hibernate)

## More Details
[More details](https://doc.acein.cn/#sort=it&doc=win%2FSuspend.md)

## Contact
support@acein.cn

## Introduction

槑囙
技术 > Windows快捷睡眠最佳实践
Windows系统 快捷睡眠 最佳实践
相关概念说明
Acein

计算机睡眠功能命令,使用WINDOWS命令行进入睡眠模式

注意：是进入“睡眠模式”。而不是休眠模式。

睡眠和休眠都是保存操作系统的现场大态进入省电模式，唤醒之后又回到玩场的一种技术。

睡眠： 内存条带电，唤醒很快， 但者在睡眠状态时断电，数据就会秀失。

休眠： 内存条里的数据都写八硬盘，然后內存条断电， 唤醒时把硬盘教琚读人内存以恢复现场。 唤醒速度较儽，但不怕断电。

混合休眠： 内存条和硬盘同时保留数据， 使得机器在某个时间点进入睡眠， 然后在另一个时间点被“任务计划”自动唤醒并执行批处理或VBS脚本， 从而实现睡眠和唤醒的自动化操作， 这样就能省电，也能演唱机器的寿命。

目的要求
Windows系统睡眠（不是休眠）
有快捷键
尽量少对系统进行配置
最佳实践方法 PsShutdown
下载Syslnternals的PsShutdown工具，放置到固定位置 如： C:\bin\psshutdown.exe
    测试命令：psshutdown.exe -d -t 0
创建简介方式（见参考文章3的方法四）

优点：

此工具可以在不禁用休眠，也不用提升至管理品权限的情况下使PC进入睡眠状态
其他方法 1 （基础方法）
Windows仅允许硬件电源按钮，或开始菜单/开始屏幕，电源按钮进入睡眠(待机)模式，并没有提供直接进入眠模式的命令行工具。 笔记本：一般合上就自动进如睡眠模式

其他方法 2 （命令行）
如果你的PC上禁用了休眠模式、則直接可以使用以下命令进入睡眠模式：

rundlI32.exe powrprof.dii,SetSuspendState 0,1,0
但是，如果你启用了休眠模二(默认情况下就是这样)，以上命令将使PC休眠，而不是进入睡眠。因此需要这样写

powercfg -h off

rundlI32.exe powrprof.dll,SetSuspendState 0,1,0

powercfg -h on
第一行禁用了休眠模式，第二行使得PC进入睡眠状态，第三行再允许休眠模式。

注：第1行和第3行都需要管理员权限。

其他方法3 （PowerShell脚本）
创建纯文本文件sleep.ps1:

Add-Type -Assembly System.Windows.Forms
[System.Windows.Forms.Application]SetSuspendState("Suspend", $false, Strue)
再运行Powershell调用之，即进入睡眠模式：

powershell -File C:\your-path\sleep.ps1
如果报错说无权运行脚本，先运行这个命令(需管理员权限)：

powershell Set ExecutionPolicy RemoteSigned/LocalMachine
命令行函数
参数说明参考

参考文章：
1. PsShutdown

2. 计算机睡眠功能命令,使用WINDOWS命令行进入睡眠模式

3. win10休眠快捷键是哪个 win10休眠的多种快捷键方法介绍

4. Win10设置一键睡眠命令
