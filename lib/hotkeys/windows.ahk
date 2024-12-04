#Requires AutoHotkey v2.0

; LButton::
; {
;     if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 50) {
;         return
;     }
;     else {
;         Click "down"
;         KeyWait "LButton"
;         Click "up"
;     }
; }

#-::
{
    Send("{Volume_Down}")
}

#=::
{
    Send("{Volume_Up}")
}

#HotIf not IsFullscreen()
^q:: {
    send("!{F4}")
    KeyWait("q")
}
#HotIf

#+l::
{
    ToolTip("Desligando a tela...")
    Sleep(1000)
    SendMessage(0x112, 0xF170, 2, , "Program Manager")
    ToolTip("")
    KeyWait("l")
}

#+q::
{
    if (ProcessExist("DMT.exe")) {
        Send("#+q")
    }
    else {
        Run(ShortcutsPath . "DMT.lnk")
        Sleep(500)
        Send("#+q")
    }
    KeyWait("q")
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

#Home:: {
    run("taskmgr.exe")
    KeyWait("Home")
}

#!Home::
{
    Run(ShortcutsPath . "WindowSpy")
    KeyWait("Home")
}

#l:: {
    run("cmd.exe /c python " . A_ScriptDir . "\lib\utils\python\night-light.py", , "hide")
}

#n::
{
    Run("ms-settings:nightlight")
    KeyWait("n")
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
