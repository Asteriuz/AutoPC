#Requires AutoHotkey v2.0-a
#SingleInstance Force

#Requires AutoHotkey v2.0-a
#SingleInstance Force

MonitorsMenu := Menu()
MonitorsMenu.Add("Monitores", monitorHandler)
MonitorsMenu.Add("TV", monitorHandler)
MonitorsMenu.Add("All", monitorHandler)

num := 80

MonitorsMenu.SetIcon("Monitores", A_ScriptDir . "\lib\img\icons\display\monitores.ico", , num)
MonitorsMenu.SetIcon("TV", A_ScriptDir . "\lib\img\icons\display\tv.ico", , num)
MonitorsMenu.SetIcon("All", A_ScriptDir . "\lib\img\icons\display\all.ico", , num)

monitorHandler(Item, ItemPos, MyMenu) {
    if Item = "Monitores" {
        run("pwsh.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . A_ScriptDir .
            "\lib\DisplayConfig\Monitors.ps1", , "hide")
        MonitorsMenu.Default := "Monitores"
    }
    if Item = "TV" {
        run("pwsh.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . A_ScriptDir .
            "\lib\DisplayConfig\TV.ps1", , "hide")
        MonitorsMenu.Default := "TV"
    }
    if Item = "All" {
        run("pwsh.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . A_ScriptDir .
            "\lib\DisplayConfig\All.ps1", , "hide")
        MonitorsMenu.Default := "All"
    }
}

#!m:: {
    MonitorsMenu.Show()
}
