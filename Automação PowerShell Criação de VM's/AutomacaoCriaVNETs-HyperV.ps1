Import-Module Hyper-V
$ethernet = Get-NetAdapter -Name ethernet

New-VMSwitch -Name externalSwitch -NetAdapterName $ethernet.Name -AllowManagementOS $true -Notes ‘Parent OS, VMs, LAN’
New-VMSwitch -Name privateSwitch -SwitchType Private -Notes ‘Internal VMs only’

New-VMSwitch -Name internalSwitch -SwitchType Internal -Notes ‘Parent OS, and internal VMs’