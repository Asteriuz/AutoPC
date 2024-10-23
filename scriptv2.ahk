; #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; SetWorkingDir("C:\Users\augus\Utilities\Scripts\PCAutomatizerAHK-main")

#Requires AutoHotkey v2.0-a
SetNumlockState("AlwaysOff")
;SetCapsLockState, "AlwaysOff"
SetScrollLockState("AlwaysOff")
#SingleInstance

; Variables
global inputChange := false

global portraitWallpaper := "C:\Program Files (x86)\Steam\steamapps\workshop\content\431960\2831647940\scene.pkg"
global landscapeWallpaper := "C:\Program Files (x86)\Steam\steamapps\workshop\content\431960\2901461876\scene.pkg"


#Include %A_ScriptDir%\lib\menu\menu_sound.ahk
#Include %A_ScriptDir%\lib\menu\menu_monitors.ahk
#Include %A_ScriptDir%\lib\menu\menu_adobe.ahk
#Include %A_ScriptDir%\lib\menu\menu_v2new.ahk
#Include %A_ScriptDir%\lib\menu\menu_explorer.ahk
#Include %A_ScriptDir%\lib\explorerTabFunc.ahk


GetActiveExplorerTab(hwnd := WinExist("A")) {
    activeTab := 0
    try activeTab := ControlGetHwnd("ShellTabWindowClass1", hwnd) ; File Explorer (Windows 11)
    catch
        try activeTab := ControlGetHwnd("TabWindowClass1", hwnd) ; IE
    for w in ComObject("Shell.Application").Windows {
        if w.hwnd != hwnd
            continue
        if activeTab { ; The window has tabs, so make sure this is the right one.
            static IID_IShellBrowser := "{000214E2-0000-0000-C000-000000000046}"
            shellBrowser := ComObjQuery(w, IID_IShellBrowser, IID_IShellBrowser)
            ComCall(3, shellBrowser, "uint*", &thisTab := 0)
            if thisTab != activeTab
                continue
        }
        switch type(w.Document) {
            case "ShellFolderView":
                return w.Document.Folder.Self.Path
            default: ;case "HTMLDocument":
                return w.LocationURL
        }
    } }


::]help:: {
    MsgBox("# - Win`n! - Alt`n^ - Ctrl`n+ - Shift")
}

#t:: {
    ControlClick("Chrome_RenderWidgetHostHWND1", "ahk_exe chrome.exe")
}


rainha := 0
#;:: {
    global rainha
    if (ProcessExist(rainha)) {
        run("cmd.exe /c taskkill /pid " . rainha, , "hide")
        MsgBox("Rainha dormindo")
    }
    Else {
        run("cmd.exe /c cd C:\Users\augus\Code\Projetos\Rainha\palacio\Scripts & activate & cd C:\Users\augus\Code\Projetos\Rainha & python rainha.py", , "hide", &rainha)
    }
}
#!;:: {
    global rainha
    if (ProcessExist(rainha)) {
        run("cmd.exe /c taskkill /pid " . rainha, , "hide")
        MsgBox("Rainha dormindo")
    }
    Else {
        run("cmd.exe /c cd C:\Users\augus\Code\Projetos\Rainha\palacio\Scripts & activate & cd C:\Users\augus\Code\Projetos\Rainha & python rainha.py", , , &rainha)
    }
}

ChangeScreenOrientation(Orientation := "Landscape") {
    static DEVMODE, width, height
    if !IsSet(DEVMODE) {
        DEVMODE := Buffer(220, 0)
        NumPut("short", 220, DEVMODE, 68)   ; dmSize
        DllCall("EnumDisplaySettingsW", "ptr", 0, "int", -1, "ptr", DEVMODE)
        n1 := NumGet(DEVMODE, 172, "uint")
        n2 := NumGet(DEVMODE, 176, "uint")
        if n1 > n2
            width := n1, height := n2
        else
            width := n2, height := n1
    }

    switch Orientation, 0 {
        case "Landscape", 0:
Landscape:
            NumPut("int", width, DEVMODE, 172)
            NumPut("int", height, DEVMODE, 176)
            NumPut("int", DMDO_DEFAULT := 0, DEVMODE, 84)   ; dmDisplayOrientation
            DllCall("ChangeDisplaySettingsW", "ptr", DEVMODE, "uint", 0)
        case "Portrait (flipped)", 270:
            NumPut("int", width, DEVMODE, 176)
            NumPut("int", height, DEVMODE, 172)
            NumPut("int", DMDO_270 := 3, DEVMODE, 84)   ; dmDisplayOrientation
            DllCall("ChangeDisplaySettingsW", "ptr", DEVMODE, "uint", 0)
        case "Landscape (flipped)", 180:
            NumPut("int", width, DEVMODE, 172)
            NumPut("int", height, DEVMODE, 176)
            NumPut("int", DMDO_180 := 2, DEVMODE, 84)   ; dmDisplayOrientation
            DllCall("ChangeDisplaySettingsW", "ptr", DEVMODE, "uint", 0)
        case "Portrait", 90:
            NumPut("int", width, DEVMODE, 176)
            NumPut("int", height, DEVMODE, 172)
            NumPut("int", DMDO_90 := 1, DEVMODE, 84)   ; dmDisplayOrientation
        default:
            goto Landscape
    }
    DllCall("ChangeDisplaySettingsW", "ptr", DEVMODE, "uint", 0)
}

^!Up:: {
    ; using var portraitWallpaper
    Run('"C:\Program Files (x86)\Steam\steamapps\common\wallpaper_engine\wallpaper64.exe" -control openWallpaper -file "' . landscapeWallpaper . '"')
    ChangeScreenOrientation("Landscape")
}

^!Down:: {
    Run('"C:\Program Files (x86)\Steam\steamapps\common\wallpaper_engine\wallpaper64.exe" -control openWallpaper -file "' . landscapeWallpaper . '"')
    ChangeScreenOrientation("Landscape (flipped)")
}

^!Left:: {
    Run('"C:\Program Files (x86)\Steam\steamapps\common\wallpaper_engine\wallpaper64.exe" -control openWallpaper -file "' . portraitWallpaper . '"')
    ChangeScreenOrientation("Portrait (flipped)")
}

^!Right:: {
    Run('"C:\Program Files (x86)\Steam\steamapps\common\wallpaper_engine\wallpaper64.exe" -control openWallpaper -file "' . portraitWallpaper . '"')
    ChangeScreenOrientation("Portrait")
}

#e:: {
    ExplorerNewTab("C:\Users\augus")
}

#d:: {
    ; Run("C:\Users\augus\Downloads")
    ExplorerNewTab("C:\Users\augus\Downloads")
}

#HotIf ((WinActive("ahk_exe Code.exe") or WinActive("ahk_exe Notepad.exe") or WinActive("ahk_exe Notepad++.exe")) and InStr(WinGetTitle("A"), "scriptv2.ahk"))
^s:: {
    Reload
    Send("^s")
    KeyWait("s")
}
#HotIf

#+r:: {
    Reload
}


#l:: {
    run("cmd.exe /c python " . A_ScriptDir . "\lib\night-light.py", , "hide")
}

#^l:: {
    ExplorerNewTab("shell:RecycleBinFolder")
}


#^w::
{
    if WinActive("ahk_exe ui32.exe")
    {
        WinMinimize(" ahk_exe ui32.exe")
    }
    else if WinExist("ahk_exe ui32.exe")
    {
        WinActivate(" ahk_exe ui32.exe")
    }
    else
        run("C:\Program Files (x86)\Steam\steamapps\common\wallpaper_engine\wallpaper32.exe")
    KeyWait("w")
}


#w::
{
    run("C:\Users\augus\Utilities\Shortcuts\WhatsApp.lnk")
    KeyWait("w")
}

#Home:: run("taskmgr.exe")

; #HotIf !WinActive("ahk_exe League of Legends.exe") && !WinActive("ahk_exe javaw.exe")
; ^q::
; {
;     send("!{F4}")
;     KeyWait("q")
; }

#n::
{
    Run("ms-settings:nightlight")
}

#b::
{
    Run("C:\Program Files\Google\Chrome\Application\chrome.exe")
    Sleep(150)
    if WinActive("ahk_exe chrome.exe") {
        Sleep(100)
        ControlClick("Chrome_RenderWidgetHostHWND1", "ahk_exe chrome.exe")
    }
    KeyWait("b")
}

#+b::
{
    Run("`"C:\Program Files\Google\Chrome\Application\chrome.exe`" -incognito")
    KeyWait("b")
}

^t::
{
    Send("^t")
    if WinActive("ahk_exe chrome.exe") {
        Sleep(75)
        ControlClick("Chrome_RenderWidgetHostHWND1", "ahk_exe chrome.exe")
    }
    KeyWait("t")
}

#+g::
{
    Run("https://github.com/Asteriuz/FiapPC")
    KeyWait("g")
}

#!Home::
{
    run("C:\Program Files\AutoHotkey\WindowSpy.ahk")
}

#Insert::
{
    run("C:\Program Files\Microsoft VS Code\Code.exe C:\Users\augus\Utilities\Scripts\PCAutomatizerAHK-main\scriptv2.ahk")
    KeyWait("Insert")
}

#!Insert::
{
    run("C:\Program Files\Microsoft VS Code\Code.exe C:\Users\augus\Utilities\Scripts\PCAutomatizerAHK-main")
    KeyWait("Insert")
}

#HotIf WinActive("ahk_exe Code.exe")
#+d:: {
    Run("python " . A_ScriptDir . "\lib\terminal.py")
    KeyWait("d")
}
#HotIf

#!v::
{
    ExplorerNewTab("C:\Users\augus\Videos")
    KeyWait("d")
}

#HotIf WinActive("ahk_exe Code.exe")
^!.:: {
    Send("^!{.}")
    global inputChange
    if (inputChange = true)
        run("python " . A_ScriptDir . "\lib\panel.py 1", , "hide")
    else
        run("python " . A_ScriptDir . "\lib\panel.py 0 ", , "hide")
    inputChange := !inputChange
    KeyWait(".")
}
#HotIf

LControl & RAlt::
{
    Send("!{space}")
}


#c::
{
    if (WinActive("ahk_exe explorer.exe")) {
        explorerpath := GetActiveExplorerTab()
        Sleep(150)
        Run("`"C:\Program Files\Microsoft VS Code\Code.exe`"" . "`"" explorerpath . "`"")
        KeyWait("c")
    }
    else {
        run("C:\Program Files\Microsoft VS Code\Code.exe")
    }
}


#!c::
{
    run("calc")
}

#!p::
{
    Run("C:\Program Files\Microsoft VS Code\Code.exe C:\Users\augus\Code\Python\Testes\Testes.py")
    KeyWait("p")
}

#!u::
{
    ExplorerNewTab("C:\Users\augus\Udemy")
    KeyWait("u")
}

#enter::
{
    if (WinActive("ahk_exe explorer.exe")) {
        ; check if ahk class is ahk_class WorkerW
        if (WinActive("ahk_class WorkerW")) {
            Sleep(150)
            run("wt", , , &varpid)
            KeyWait("enter")
        }
        else {
            explorerpath := GetActiveExplorerTab()
            Sleep(150)
            run("wt -d`"" . explorerpath . "`"", , , &varpid)
            KeyWait("enter")
        }
    } else {
        Sleep(150)
        run("wt", , , &varpid)
        KeyWait("enter")
    }
}


#HotIf WinActive("ahk_exe explorer.exe")
^enter::
{
    Send("{F2}")
    KeyWait("enter")
}
#HotIf


#-::
{
    Send("{Volume_Down}")
}


#=::
{
    Send("{Volume_Up}")
}


#!b::
{
    run("ms-settings:bluetooth")

}


#!d::
{
    run("ms-settings:storagesense")
}


#!l::
{
    Sleep 1000
    SendMessage(0x112, 0xF170, 2, , "Program Manager")
}

#^PrintScreen:: {
    ExplorerNewTab("C:\Users\augus\Pictures\Screenshots")
}

#!PrintScreen:: {
    ExplorerNewTab("C:\Users\augus\Pictures\Screenshots")
}

#^d:: {
    run("C:\Users\augus\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk")
}

#h:: {
    Run(A_ScriptDir . "\lib\hiddenfile.ahk")
    KeyWait("h")
}


;******************************************************************************
;                             Text Replacement
;******************************************************************************

::]s::&nbsp;


::]hm::augustobb@live.com


::]gm::gutocebola@gmail.com


::]nome::Augusto Barcelos Barros


::]fiap::98078


;******************************************************************************
;		                   	Computer information
;******************************************************************************
::]id:: {
    SendInput(A_UserName)
}

; ::]ip::{
; ;   SendInput(A_IPAddress)
; }


::]comp:: {
    SendInput(A_ComputerName)
}


::]adb:: {
    SendInput("192.168.15.5:5555")
}

;******************************************************************************
;		                        	-* lines
;******************************************************************************
::]-10::----------


::]-20::--------------------


::]-30::------------------------------


::]-40::----------------------------------------


::]-50::--------------------------------------------------


::]*10::**********


::]*20::********************


::]*30::******************************


::]*40::****************************************


::]*50::**************************************************


;******************************************************************************
;	                   		Date/Time Stamps
;******************************************************************************
; ::]d::{
;   FormatTime, CurrentDate,, M/d/yyyy
;   SendInput CurrentDate
; }

; ::]dl::{
;   FormatTime(CurrentDate,, dddd, MMMM d, yyyy)
;   SendInput CurrentDate
; }

; ::]t::{
;   FormatTime, Time,, H:mm
;   sendinput Time
; }


::vsf:: {
    sendinput("te amo")
}


;******************************************************************************
;		                    	Programação
;******************************************************************************

::]inp:: {
    sendinput("int(input(`"`")")
}

::]finp:: {
    sendinput(" float(input(`"`"))")
}

::]pylibsize:: {
    A_Clipboard := FileRead(A_ScriptDir . "/lib/pytestsize.txt")
    Send("^v")
}


;******************************************************************************
;		                        Simbolos
;******************************************************************************

::]ohm:: {
    Send("{U+03A9}")
}

::]ordinal:: {
    Send("{U+00BA}")
}

::]grau:: {
    Send("{U+00B0}")
}