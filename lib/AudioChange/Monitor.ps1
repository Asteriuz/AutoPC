$id = Get-AudioDevice -List | Where-Object { $_.Name -like '*Soundbar (High Definition Audio Device)*' } | Select-Object -ExpandProperty ID
Set-AudioDevice -ID $id -Default