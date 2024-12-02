; #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.

#Requires AutoHotkey v2.0-a
SetNumlockState("AlwaysOff")
;SetCapsLockState, "AlwaysOff"
SetScrollLockState("AlwaysOff")
#SingleInstance

; Variables
global inputChange := false

#Include %A_ScriptDir%\lib\menu\menu_sound.ahk
#Include %A_ScriptDir%\lib\menu\menu_monitors.ahk
#Include %A_ScriptDir%\lib\menu\menu_adobe.ahk
#Include %A_ScriptDir%\lib\menu\menu_project.ahk
#Include %A_ScriptDir%\lib\menu\menu_explorer.ahk

#Include %A_ScriptDir%\lib\utils\explorerTabFunc.ahk
#Include %A_ScriptDir%\lib\utils\getActiveExplorerTab.ahk
#Include %A_ScriptDir%\lib\utils\isFullscreen.ahk

::]help:: {
    MsgBox("# - Win`n! - Alt`n^ - Ctrl`n+ - Shift")
}

::]win::{#}
::]shift::{+}
::]alt::{!}
::]ctrl::{^}

#HotIf not isFullscreen()
^q:: {
    send("!{F4}")
    KeyWait("q")
}
#HotIf

#e:: {
    ExplorerNewTab("C:\Users\augus")
    KeyWait("e")
}

#d:: {
    ExplorerNewTab("C:\Users\augus\Downloads")
    KeyWait("d")
}

#HotIf ((WinActive("ahk_exe Code.exe") or WinActive("ahk_exe Notepad.exe") or WinActive("ahk_exe Notepad++.exe")) and
InStr(WinGetTitle("A"), "AutoPC"))
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
    run("cmd.exe /c python " . A_ScriptDir . "\lib\python\night-light.py", , "hide")
}

#^l:: {
    ExplorerNewTab("shell:RecycleBinFolder")
}

#^w::
{
    if WinActive("ahk_exe ui32.exe") {
        WinMinimize(" ahk_exe ui32.exe")
    }
    else if WinExist("ahk_exe ui32.exe") {
        WinActivate(" ahk_exe ui32.exe")
    }
    else
        run("C:\Program Files (x86)\Steam\steamapps\common\wallpaper_engine\wallpaper32.exe")
    KeyWait("w")
}

#w::
{
    run("C:\Users\augus\Utils\Shortcuts\WhatsApp.lnk")
    KeyWait("w")
}

#Home:: run("taskmgr.exe")

#n::
{
    Run("ms-settings:nightlight")
    KeyWait("n")
}

#b::
{
    Run("C:\Program Files\Firefox Developer Edition\firefox.exe")
    Sleep(150)
    if WinActive("ahk_exe chrome.exe") {
        Sleep(100)
        ControlClick("Chrome_RenderWidgetHostHWND1", "ahk_exe chrome.exe")
    }
    KeyWait("b")
}

#+g::
{
    Run("https://github.com/Asteriuz/AutoPC")
    KeyWait("g")
}

#!Home::
{
    run("c:\Program Files\AutoHotkey\WindowSpy.ahk")
    KeyWait("Home")
}

#Insert::
{
    run("c:\Users\augus\Utils\Apps\VSCode\Code.exe " . A_ScriptDir . "\scriptv2.ahk")
    KeyWait("Insert")
}

#!Insert::
{
    run("c:\Users\augus\Utils\Apps\VSCode\Code.exe " . A_ScriptDir . "")
    KeyWait("Insert")
}

#HotIf WinActive("ahk_exe Code.exe")
#+d:: {
    Run("python " . A_ScriptDir . "\lib\python\terminal.py")
    KeyWait("d")
}
#HotIf

#HotIf WinActive("ahk_exe Code.exe")
^!.:: {
    Send("^!{.}")
    run("python " . A_ScriptDir . "\lib\python\panel.py", , "hide")
}
#HotIf

#HotIf WinActive("ahk_exe Code.exe")
^!s:: {
    Send("^!s")
    run("python " . A_ScriptDir . "\lib\python\auto-save.py", , "hide")
}
#HotIf

#c::
{
    if (WinActive("ahk_exe explorer.exe")) {
        explorerpath := GetActiveExplorerTab()
        Sleep(150)
        Run("`"c:\Users\augus\Utils\Apps\VSCode\Code.exe`"" . "`"" explorerpath . "`"")
        KeyWait("c")
    }
    else {
        run("c:\Users\augus\Utils\Apps\VSCode\Code.exe")
    }
}

#!c::
{
    run("calc")
    KeyWait("c")
}

#enter::
{
    if (WinActive("ahk_exe explorer.exe")) {
        if (WinActive("ahk_class Progman")) {
            Sleep(150)
            run("wt")
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
    KeyWait("b")
}

#!d::
{
    run("ms-settings:storagesense")
    KeyWait("d")
}

#!l::
{
    Sleep 1000
    SendMessage(0x112, 0xF170, 2, , "Program Manager")
    KeyWait("l")
}

#^PrintScreen:: {
    ExplorerNewTab("C:\Users\augus\Pictures\Screenshots")
    KeyWait("PrintScreen")
}

#!PrintScreen:: {
    ExplorerNewTab("C:\Users\augus\Pictures\Screenshots")
    KeyWait("PrintScreen")
}

#^d:: {
    run("C:\Users\augus\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk")
    KeyWait("d")
}

#h:: {
    Run(A_ScriptDir . "\lib\utils\hiddenfile.ahk")
    KeyWait("h")
}

#Include %A_ScriptDir%\lib\utils\replaceText.ahk