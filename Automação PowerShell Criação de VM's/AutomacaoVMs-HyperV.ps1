function criaVM {

    $iso = Read-Host "`n1: Windows Server 2022 `n2: Windows Server 2019 `n3: Windows Server 2016 `n`nDeseja utilizar qual SO"

    if ($iso -eq 1) { WSERVER2022 }
    elseif ($iso -eq 2) { WSERVER2019 }
    elseif ($iso -eq 3) { WSERVER2016 }

    function WSERVER2022 {
        # Defina uma lista vazia para armazenar os nomes das máquinas virtuais
        $nomesVM = @()

        # Função para verificar se o nome já existe
        function NomeExiste($VMName) {
            return $nomesVM -contains $VMName
        }

        # Loop para criar as máquinas virtuais
        for ($i = 1; ; $i++) {
            # Gere o nome da máquina virtual
            $nomeVM = "HV-WSERVER19-VM$i"

            $VM = @{
                Name = $nomeVM
                MemoryStartupBytes = $quantMemomry
                Generation = 2
                NewVHDPath = "C:\Users\TerraformLab\Documents\VirtualTest\$VMName\$VMName.vhdx"
                NewVHDSizeBytes = 53687091200
                BootDevice ="VHD"
                Path = "C:\Virtual Machines\$nomeVM"
                SwitchName = (Get-VMSwitch).Name
                }
    
                New-VM @VM$i

            # Verifique se o nome já existe na lista
            if (NomeExiste($nomeVM)) {
                continue  # Se o nome existe, volte ao início do loop para tentar outro número
            }

            # Adicione o nome da máquina virtual à lista
            $nomesVM += $nomeVM

            # Aqui, você pode adicionar o código para criar a máquina virtual com o nome $nomeVM

            # Defina o número máximo de máquinas virtuais que você deseja criar
            $quantVMs = Read-Host "Quantas máquinas virtuais você deseja criar?"
    
            $contVMs = $quantVMs

            $numeroMaxVMs = $contVMs
            if ($nomesVM.Count -ge $numeroMaxVMs) {
                break  # Saia do loop se atingir o número máximo de máquinas virtuais
            }
        }
    }

    function WSERVER2019 {
        # Defina uma lista vazia para armazenar os nomes das máquinas virtuais
        $nomesVM = @()

        # Função para verificar se o nome já existe
        function NomeExiste($VMName) {
            return $nomesVM -contains $VMName
        }

        # Loop para criar as máquinas virtuais
        for ($i = 1; ; $i++) {
            # Gere o nome da máquina virtual
            $nomeVM = "HV-WSERVER19-VM$i"

            $VM = @{
                Name = $nomeVM
                MemoryStartupBytes = $quantMemomry
                Generation = 2
                NewVHDPath = "C:\Users\TerraformLab\Documents\VirtualTest\$VMName\$VMName.vhdx"
                NewVHDSizeBytes = 53687091200
                BootDevice ="VHD"
                Path = "C:\Virtual Machines\$nomeVM"
                SwitchName = (Get-VMSwitch).Name
                }
    
                New-VM @VM$i

            # Verifique se o nome já existe na lista
            if (NomeExiste($nomeVM)) {
                continue  # Se o nome existe, volte ao início do loop para tentar outro número
            }

            # Adicione o nome da máquina virtual à lista
            $nomesVM += $nomeVM

            # Aqui, você pode adicionar o código para criar a máquina virtual com o nome $nomeVM

            # Defina o número máximo de máquinas virtuais que você deseja criar
            $quantVMs = Read-Host "Quantas máquinas virtuais você deseja criar?"
    
            $contVMs = $quantVMs

            $numeroMaxVMs = $contVMs
            if ($nomesVM.Count -ge $numeroMaxVMs) {
                break  # Saia do loop se atingir o número máximo de máquinas virtuais
            }
        }
    }

    function WSERVER2016 {
        # Defina uma lista vazia para armazenar os nomes das máquinas virtuais
        $nomesVM = @()

        # Função para verificar se o nome já existe
        function NomeExiste($VMName) {
            return $nomesVM -contains $VMName
        }

        # Loop para criar as máquinas virtuais
        for ($i = 1; ; $i++) {
            # Gere o nome da máquina virtual
            $nomeVM = "HV-WSERVER19-VM$i"

            $VM = @{
                Name = $nomeVM
                MemoryStartupBytes = $quantMemomry
                Generation = 2
                NewVHDPath = "C:\Users\TerraformLab\Documents\VirtualTest\$VMName\$VMName.vhdx"
                NewVHDSizeBytes = 53687091200
                BootDevice ="VHD"
                Path = "C:\Virtual Machines\$nomeVM"
                SwitchName = (Get-VMSwitch).Name
                }
    
                New-VM @VM$i

            # Verifique se o nome já existe na lista
            if (NomeExiste($nomeVM)) {
                continue  # Se o nome existe, volte ao início do loop para tentar outro número
            }

            # Adicione o nome da máquina virtual à lista
            $nomesVM += $nomeVM

            # Aqui, você pode adicionar o código para criar a máquina virtual com o nome $nomeVM

            # Defina o número máximo de máquinas virtuais que você deseja criar
            $quantVMs = Read-Host "Quantas máquinas virtuais você deseja criar?"
    
            $contVMs = $quantVMs

            $numeroMaxVMs = $contVMs
            if ($nomesVM.Count -ge $numeroMaxVMs) {
                break  # Saia do loop se atingir o número máximo de máquinas virtuais
            }
        }
    }

}

function criaVNET {
    $decisionVnet = Read-Host "`n1: ExternalSwitch `n2: PrivateSwitch `n3: InternalSwitch `n`n"

    if ($decisionVnet -eq 1) { ExternalSwitch }
    elseif ($decisinVnet -eq 2) { PrivateSwitch }
    elseif ($decisinVnet -eq 3) { InternalSwitch }
    
    Import-Module Hyper-V
    $ethernet = Get-NetAdapter -Name ethernet

    function ExternalSwitch {
        New-VMSwitch -Name externalSwitch -NetAdapterName $ethernet.Name -AllowManagementOS $true -Notes ‘Parent OS, VMs, LAN’
    }

    function PrivateSwitch {
        New-VMSwitch -Name privateSwitch -SwitchType Private -Notes ‘Internal VMs only’
    }
    
    function InternalSwitch {
        New-VMSwitch -Name internalSwitch -SwitchType Internal -Notes ‘Parent OS, and internal VMs’
    }
    
}

function alteraSIZE {
    $frageVMName = Read-Host "Qual o nome da VM que você deseja alterar o size?"
    $VMname = $frageVMName

    $frageProcessor = Read-Host "Digite a quantidade de processador que você deseja"
    $newProcessorCount = $frageProcessor 

    $frageMemory = Read-Host "Digite a quantidade de mémoria que você deseja (EM BYTES)"
    $newMemomySizeGB = $frageMemory

    $valorEmGB = $newMemomySizeGB / 1MB

    $vm = Get-VM -Name $vmName

    if($vm -eq $null){
        Write-Output "A VM '$vmName' não foi encontrada."
    }else{
        #Altere o número de processadores
        Set-VMProcessor -VMName $VMName -Count $newProcessorCount

        #Altere a quantidade de memória RAM
        Set-VMMemory -VMName $VMname -DynamicMemoryEnabled $true -MaximumBytes 4096MB -MinimumBytes 512MB -StartupBytes $newMemomySizeGB

        Write-Output "A VM '$VMName' foi redimensionada com $newProcessorCount processadores e $($valorEmGB.ToString('F0')) MB de memória RAM."
    }
}

function destroyVM {
    $VMMesage = Read-Host "Deseja destruir qual VM?"
    Write-Host "Ok, só seguir o procedimento e a $VMMesage será destruida!" 

    Remove-VM "$VMMesage"

    Write-Host "Máquina Virtual destruída com sucesso!"
}

function destroyVNET {
    $SwitchMesage = Read-Host "Deseja destruir qual switch?"
    Write-Host "Ok, só seguir o procedimento e o switch $SwitchMesage será destruido!" 

    Remove-VMSwitch "SwitchMesage"

    Write-Host "Switch destruído com sucesso!"
}

$choice = Read-Host "`n1: Criação de VM's `n2: Criação de VNET's `n3: ALteração de size VM's `n4: Destruição VM's `n5: Destruição VNET's `n `nInforme um dos números acima"

    if ( $choice -eq 1 ) { criaVM }
    elseif ( $choice -eq 2 ) { criaVNET}
    elseif ( $choice -eq 3 ) { alteraSIZE }
    elseif ( $choice -eq 4 ) { destroyVM }
    elseif ( $choice -eq 5 ) { destroyVNET }

$result