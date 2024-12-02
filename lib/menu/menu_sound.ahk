#Requires AutoHotkey v2.0-a
#SingleInstance Force

SoundMenu := Menu()
SoundMenu.Add("Monitor", soundHandler)
SoundMenu.Add("Fone", soundHandler)
SoundMenu.Add("TV", soundHandler)

num := 80

SoundMenu.SetIcon("Monitor", A_ScriptDir . "\lib\img\icons\sound\monitor.ico", , num)
SoundMenu.SetIcon("Fone", A_ScriptDir . "\lib\img\icons\sound\fone.ico", , num)
SoundMenu.SetIcon("TV", A_ScriptDir . "\lib\img\icons\sound\tv.ico", , num)

run("powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . A_ScriptDir .
    "\lib\AudioChange\GetDefaultAudioDevice.ps1", , "hide")

soundHandler(Item, ItemPos, MyMenu) {
    if Item = "Monitor" {
        run("pwsh.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . A_ScriptDir .
            "\lib\AudioChange\Monitor.ps1", , "hide")
        FileDelete(".\lib\AudioChange\DefaultAudioDevice.txt")
        FileAppend("Alto-falantes (High Definition Audio Device)", ".\lib\AudioChange\DefaultAudioDevice.txt")
    }
    if Item = "Fone" {
        run("pwsh.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . A_ScriptDir .
            "\lib\AudioChange\Headset.ps1", , "hide")
        FileDelete(".\lib\AudioChange\DefaultAudioDevice.txt")
        FileAppend("Headset Earphone (Razer Audio Controller - Chat)", ".\lib\AudioChange\DefaultAudioDevice.txt")

    }
    if Item = "TV" {
        run("pwsh.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . A_ScriptDir .
            "\lib\AudioChange\TV.ps1", , "hide")
        FileDelete(".\lib\AudioChange\DefaultAudioDevice.txt")
        FileAppend("LG TV SSCR2 (NVIDIA High Definition Audio)", ".\lib\AudioChange\DefaultAudioDevice.txt")

    }
}

#!s:: {
    OutputVar := FileRead(".\lib\AudioChange\DefaultAudioDevice.txt")
    if (OutputVar == "Alto-falantes (High Definition Audio Device)") {
        SoundMenu.Default := "Monitor"
    }
    else if (OutputVar == "Headset Earphone (Razer Audio Controller - Chat)") {
        SoundMenu.Default := "Fone"
    }
    else if (OutputVar == "LG TV SSCR2 (NVIDIA High Definition Audio)") {
        SoundMenu.Default := "TV"
    }
    SoundMenu.Show()
}
