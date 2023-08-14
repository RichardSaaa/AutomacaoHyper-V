$VMName = "VMNAME"

$VM = @{
    Name = $VMName
    MemoryStartupBytes = 2048MB
    Generation = 2
    NewVHDPath = "C:\Users\TerraformLab\Documents\VirtualTest\$VMName\$VMName.vhdx"
    NewVHDSizeBytes = 53687091200
    BootDevice ="VHD"
    Path = "C:\Virtual Machines\$VMName"
    SwitchName = (Get-VMSwitch).Name
}

New-VM @VM