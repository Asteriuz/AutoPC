$id = Get-AudioDevice -List | Where-Object { $_.Name -like '*Alto-falantes (High Definition Audio Device)*' } | Select-Object -ExpandProperty ID
Set-AudioDevice -ID $id -Default