$id = Get-AudioDevice -List | Where-Object { $_.Name -like '*Fone (Razer Audio Controller - Chat)*' } | Select-Object -ExpandProperty ID
Set-AudioDevice -ID $id -Default