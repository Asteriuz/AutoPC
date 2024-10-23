#Requires AutoHotkey v2.0-a
#SingleInstance Force


sommenu := Menu()
sommenu.Add("Monitor", somhandler)
sommenu.Add("Fone", somhandler)
sommenu.Add("TV", somhandler)


somhandler(Item, ItemPos, MyMenu) {
    If Item = "Monitor" {
        run("powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile C:\Users\augus\Utilities\Scripts\PCAutomatizerAHK-main\lib\AudioChange\Monitor.ps1", , "hide")
    }
    If Item = "Fone" {
        run("powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile C:\Users\augus\Utilities\Scripts\PCAutomatizerAHK-main\lib\AudioChange\Headset.ps1", , "hide")
    }
    If Item = "TV" {
        run("powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile C:\Users\augus\Utilities\Scripts\PCAutomatizerAHK-main\lib\AudioChange\TV.ps1", , "hide")
    }
}

#!s:: {
    sommenu.Show()
}