CLS
Find-DBAInstance -Computername localhost
Install-dbainstance -version 2019 -sqlinstance harv2020\TheWaiter -feature Engine -Path E:\sql2019 -authenticationmode mixed
CLS
Copy-DBASPConfigure -Source Harv2020 -Destination HARV2020\JOEBATTERS  -whatif
$DBAConfigureSplat = @{
Source = 'Harv2020'
Destination = 'HARV2020\JOEBATTERS'
}
Copy-DBASPConfigure @DBAConfigureSplat 
Copy-DbaInstanceAudit –Source Harv2020-Destination HARV2020\JOEBATTERS  -whatif
Copy-DbaInstanceAuditSpecification –Source Harv2020-Destination HARV2020\JOEBATTERS  -whatif

Copy-DbaPolicyManagement –Source Harv2020-Destination HARV2020\JOEBATTERS  -whatif
Copy-DbaXeSession –Source Harv2020-Destination HARV2020\JOEBATTERS  -whatif
Copy-dbalogin –Source Harv2020-Destination HARV2020\JOEBATTERS -SyncSaName   -whatif
rename-dbaLogin -sqlinstance HARV2020\JOEBATTERS -login sa -newlogin 'Charles Chuckie English' -Whatif
Copy-DbaDatabase –Source Harv2020-Destination HARV2020\JOEBATTERS -AllDatabases -BackupRestore -Sharedpath 'E:\DBAToolsDemo\' ##-UseLastBackup -whatif
Start-DbaMigration –Source Harv2020 –Destination HARV2020\THEWAITER -BackupRestore –SharedPath 'E:\DBAToolsDemo\' -whatif
Repair-DbaDbOrphanUser -SqlInstance harv2020\joebatters -WhatIf
get-help get-dbauserpermission -showwindow
Get-DbaLogin -SqlInstance Harv2020\JoeBatters -Login 'Frank Pantangeline' 
Set-DbaLogin -SqlInstance Harv2020\JoeBatters -Login 'Frank Pantangeline' -Disable -whatif