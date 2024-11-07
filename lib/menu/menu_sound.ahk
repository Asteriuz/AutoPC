#Requires AutoHotkey v2.0-a
#SingleInstance Force

SomMenu := Menu()
SomMenu.Add("Monitor", somhandler)
SomMenu.Add("Fone", somhandler)
SomMenu.Add("TV", somhandler)

num := 60

SomMenu.SetIcon("Monitor", A_ScriptDir . "\lib\img\icons\monitor.ico", , num)
SomMenu.SetIcon("Fone", A_ScriptDir . "\lib\img\icons\fone.ico", , num)
SomMenu.SetIcon("TV", A_ScriptDir . "\lib\img\icons\tv.ico", , num)

run("powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . A_ScriptDir .
    "\lib\AudioChange\GetDefaultAudioDevice.ps1", , "hide")

somhandler(Item, ItemPos, MyMenu) {
    if Item = "Monitor" {
        run("powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . A_ScriptDir .
            "\lib\AudioChange\Monitor.ps1", , "hide")
        FileDelete(".\lib\AudioChange\DefaultAudioDevice.txt")
        FileAppend("Alto-falantes (High Definition Audio Device)", ".\lib\AudioChange\DefaultAudioDevice.txt")
    }
    if Item = "Fone" {
        run("powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . A_ScriptDir .
            "\lib\AudioChange\Headset.ps1", , "hide")
        FileDelete(".\lib\AudioChange\DefaultAudioDevice.txt")
        FileAppend("Headset Earphone (Razer Audio Controller - Chat)", ".\lib\AudioChange\DefaultAudioDevice.txt")

    }
    if Item = "TV" {
        run("powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . A_ScriptDir .
            "\lib\AudioChange\TV.ps1", , "hide")
        FileDelete(".\lib\AudioChange\DefaultAudioDevice.txt")
        FileAppend("LG TV SSCR2 (NVIDIA High Definition Audio)", ".\lib\AudioChange\DefaultAudioDevice.txt")

    }
}

#!s:: {
    OutputVar := FileRead(".\lib\AudioChange\DefaultAudioDevice.txt")
    if (OutputVar == "Alto-falantes (High Definition Audio Device)") {
        SomMenu.Default := "Monitor"
    }
    else if (OutputVar == "Headset Earphone (Razer Audio Controller - Chat)") {
        SomMenu.Default := "Fone"
    }
    else if (OutputVar == "LG TV SSCR2 (NVIDIA High Definition Audio)") {
        SomMenu.Default := "TV"
    }
    SomMenu.Show()
}
