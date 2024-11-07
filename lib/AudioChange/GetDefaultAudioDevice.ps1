# Load AudioDeviceCmdlets module
Import-Module AudioDeviceCmdlets

# Get default audio output device (playback device)
$defaultPlaybackDevice = (Get-AudioDevice -List | Where-Object { $_.Type -eq 'Playback' -and $_.Default -eq $true }).Name

# Write to text file without adding an extra line
$defaultPlaybackDevice | Out-File -FilePath ".\lib\AudioChange\DefaultAudioDevice.txt" -Encoding utf8 -NoNewline
