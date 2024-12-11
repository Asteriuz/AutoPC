#Requires AutoHotkey v2.0-a
#SingleInstance Force

#Requires AutoHotkey v2.0-a
#SingleInstance Force

DisplayMenu := Menu()
DisplayMenu.Add("Monitores", monitorHandler)
DisplayMenu.Add("TV", monitorHandler)
DisplayMenu.Add("All", monitorHandler)

num := 80

DisplayMenu.SetIcon("Monitores", IconPath . "\display\monitores.ico", , num)
DisplayMenu.SetIcon("TV", IconPath . "\display\tv.ico", , num)
DisplayMenu.SetIcon("All", IconPath . "\display\all.ico", , num)

DisplayMenu.Default := "Monitores"

monitorHandler(Item, ItemPos, MyMenu) {
    if Item = "Monitores" {
        run("pwsh.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . UtilsPath .
            "\menu\display\Monitors.ps1", , "hide")
        DisplayMenu.Default := "Monitores"
    }
    if Item = "TV" {
        run("pwsh.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . UtilsPath .
            "\menu\display\TV.ps1", , "hide")
        DisplayMenu.Default := "TV"
    }
    if Item = "All" {
        run("pwsh.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile " . UtilsPath .
            "\menu\display\All.ps1", , "hide")
        DisplayMenu.Default := "All"
    }
}

#m:: {
    DisplayMenu.Show()
}
