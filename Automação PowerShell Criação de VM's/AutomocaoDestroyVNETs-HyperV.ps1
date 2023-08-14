$SwitchMesage = Read-Host "Deseja destruir qual switch?"
Write-Host "Ok, só seguir o procedimento e o switch $SwitchMesage será destruido!" 

Remove-VMSwitch "SwitchMesage"

Write-Host "Switch destruído com sucesso!"