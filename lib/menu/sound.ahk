#Requires AutoHotkey v2.0-a
#SingleInstance Force

SoundMenu := Menu()
SoundMenu.Add("Monitor", soundHandler)
SoundMenu.Add("Fone", soundHandler)
SoundMenu.Add("TV", soundHandler)

num := 80

SoundMenu.SetIcon("Monitor", IconPath . "\sound\monitor.ico", , num)
SoundMenu.SetIcon("Fone", IconPath . "\sound\fone.ico", , num)
SoundMenu.SetIcon("TV", IconPath . "\sound\tv.ico", , num)

getDefaultAudioDevice() {
    Command := "powershell.exe -ExecutionPolicy Bypass -NoProfile -Command " .
        "'(Get-AudioDevice -List | Where-Object { $_.Type -eq ''Playback'' -and $_.Default -eq $true }).Name'"
    RunWait(Command, , "hide", &Output)
    return Trim(Output)
}

CurrentDevice := getDefaultAudioDevice()

soundHandler(Item, ItemPos, MyMenu) {
    global CurrentDevice
    if Item = "Monitor" {
        run("powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . UtilsPath .
            "\menu\sound\Monitor.ps1", , "hide")
        CurrentDevice := "Monitor"
    }
    else if Item = "Fone" {
        run("powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . UtilsPath .
            "\menu\sound\Headset.ps1", , "hide")
        CurrentDevice := "Fone"
    }
    else if Item = "TV" {
        run("powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . UtilsPath .
            "\menu\sound\TV.ps1", , "hide")
        CurrentDevice := "TV"
    }
}

#s:: {
    global CurrentDevice
    if (CurrentDevice = "Monitor") {
        SoundMenu.Default := "Monitor"
    }
    else if (CurrentDevice = "Fone") {
        SoundMenu.Default := "Fone"
    }
    else if (CurrentDevice = "TV") {
        SoundMenu.Default := "TV"
    }
    SoundMenu.Show()
}
