#Requires AutoHotkey v2.0-a
#SingleInstance Force

SoundMenu := Menu()

num := 80

global DeviceMap := Map()

populateSoundDevices() {
    global DeviceMap, SoundMenu, IconPath, num
    
    psCommand := "Get-AudioDevice -List | Where-Object { $_.Type -eq 'Playback' } | ForEach-Object { Write-Output ($_.Name + '|' + $_.ID + '|' + $_.Default) }"
    Output := RunPowerShell(psCommand, ["AudioDeviceCmdlets"])
    
    Loop Parse, Output, "`n", "`r"
    {
        if (A_LoopField = "")
            continue
            
        parts := StrSplit(A_LoopField, "|")
        deviceName := Trim(parts[1])
        deviceID := Trim(parts[2])
        isDefault := Trim(parts[3])

        menuItem := ""
        if InStr(deviceName, "Monitor") {
            menuItem := "Monitor"
        } else if InStr(deviceName, "Fone") {
            menuItem := "Fone"
        } else if InStr(deviceName, "TV") {
            menuItem := "TV"
        }
        
        if (menuItem != "" and !DeviceMap.Has(menuItem)) {
            DeviceMap[menuItem] := deviceID
            SoundMenu.Add(menuItem, soundHandler)
            SoundMenu.SetIcon(menuItem, IconPath . "\sound\" . StrLower(menuItem) . ".ico", , num)
            if (isDefault = "True") {
                SoundMenu.Default := menuItem
            }
        }
    }
}

populateSoundDevices()

soundHandler(Item, ItemPos, MyMenu) {
    global DeviceMap

    if DeviceMap.Has(Item) {
        RunPowerShell("Set-AudioDevice -ID '" . DeviceMap[Item] . "'", ["AudioDeviceCmdlets"])
        SoundMenu.Default := Item
    }
}

#s:: {
    SoundMenu.Show()
}
