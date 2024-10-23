$id = Get-AudioDevice -List | Where-Object { $_.Name -like '*LG TV SSCR2 (NVIDIA High Definition Audio)*' } | Select-Object -ExpandProperty ID
Set-AudioDevice -ID $id -Default