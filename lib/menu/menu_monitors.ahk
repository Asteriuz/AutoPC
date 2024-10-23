#Requires AutoHotkey v2.0-a
#SingleInstance Force


; monitorMenu := Menu()
; monitorMenu.Add("PC", monitorHandler)
; monitorMenu.Add("TV", monitorHandler)
; monitorMenu.Add("Todos", monitorHandler)


; monitorHandler(Item, ItemPos, MyMenu) {
;   If Item = "PC" {
;     run('MultiMonitorTool.exe /LoadConfig "C:\Users\augus\Utilities\Path\monitorscfg\PcMonitorsConfig.cfg"', , "hide")
;   }
;   If Item = "TV" {
;     run('MultiMonitorTool.exe /LoadConfig "C:\Users\augus\Utilities\Path\monitorscfg\TvMonitorsConfig.cfg"', , "hide")
;   }
;   If Item = "Todos" {
;     run('MultiMonitorTool.exe /LoadConfig "C:\Users\augus\Utilities\Path\monitorscfg\AllMonitorsConfig.cfg"', , "hide")
;   }
; }

; #!m:: {
;   monitorMenu.Show()
; }

; toggle monitor when pressing Win+M

; add var

monitorMenu := 0
#!m:: {
  global monitorMenu
  If (monitorMenu = 0) {
    Run('MultiMonitorTool.exe /LoadConfig "C:\Users\augus\Utilities\Path\monitorscfg\PcMonitorsConfig.cfg"', , "hide")
    monitorMenu := 1
  } Else {
    Run('MultiMonitorTool.exe /LoadConfig "C:\Users\augus\Utilities\Path\monitorscfg\TvMonitorsConfig.cfg"', , "hide")
    monitorMenu := 0
  }
}