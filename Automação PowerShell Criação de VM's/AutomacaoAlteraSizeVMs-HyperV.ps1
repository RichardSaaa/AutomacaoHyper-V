#Defina o nome da máquina virtual
$VMname = "VmTest0"

#Defindo o número de processadores a ser alterado.
$newProcessorCount = 2

#Defindo a quantidade de memória RAM em MB desejada.
$newMemomySizeGB = 4GB

$valorEmGB = $newMemomySizeGB / 1MB

$vm = Get-VM -Name $vmName

if($vm -eq $null){
    Write-Output "A VM '$vmName' não foi encontrada."
}else{
    #Altere o número de processadores
    Set-VMProcessor -VMName $VMName -Count $newProcessorCount

    #Altere a quantidade de memória RAM
    Set-VMMemory -VMName $VMname -DynamicMemoryEnabled $true -MaximumBytes 4GB -MinimumBytes 512MB -StartupBytes $newMemomySizeGB

    Write-Output "A VM '$VMName' foi redimensionada com $newProcessorCount processadores e $($valorEmGB.ToString('F0')) MB de memória RAM."
}