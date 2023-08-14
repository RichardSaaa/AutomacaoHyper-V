$VMMesage = Read-Host "Deseja destruir qual VM?"
Write-Host "Ok, só seguir o procedimento e a $VMMesage será destruida!" 

Remove-VM "$VMMesage"

Write-Host "Máquina Virtual destruída com sucesso!"