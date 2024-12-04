# Load AudioDeviceCmdlets module
Import-Module AudioDeviceCmdlets

# Get default audio output device (playback device)
$defaultPlaybackDevice = (Get-AudioDevice -List | Where-Object { $_.Type -eq 'Playback' -and $_.Default -eq $true }).Name

# Output the device name to the console
Write-Output $defaultPlaybackDevice
