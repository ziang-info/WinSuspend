
# powershell -File c:\bin\sleep.ps1
# powershell Set-ExecutionPolicy RemoteSigned

Add-Type -Assembly System.Windows.Forms
[System.Windows.Forms.Application]::SetSuspendState("Suspend",$false,$false)

# [in] bHibernate Hibernate 1/Suspend 0
# [in] bForce 此参数不起作用。
# [in] bWakeupEventsDisabled 如果此参数为 TRUE，系统将禁用所有唤醒事件。 如果参数为 FALSE，则保持启用任何系统唤醒事件。
