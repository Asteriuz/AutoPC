#Requires AutoHotkey v2.0

#!h:: {
    MsgBox(
        "Key`tModifier`n" .
        "------------------------`n" .
        "Win`t#`n" .
        "Alt`t!`n" .
        "Ctrl`t^`n" .
        "Shift`t+",
        "AHK Modifier Keys"
    )
}

::]win::{#}
::]shift::{+}
::]alt::{!}
::]ctrl::{^}

#Insert::
{
    Run(VsCode . " " . A_ScriptDir . "\AutoPC.ahk")
    KeyWait("Insert")
}

#!Insert::
{
    Run(VsCode . " " . A_ScriptDir)
    KeyWait("Insert")
}

#HotIf ((WinActive("ahk_exe Code.exe") or WinActive("ahk_exe Notepad.exe") or WinActive("ahk_exe Notepad++.exe")) and
InStr(WinGetTitle("A"), "AutoPC"))
^s:: {
    Send("^s")
    ToolTip("Salvando...")
    Sleep(500)
    Reload
}
#HotIf

#SuspendExempt
ScrollLock:: {
    if A_IsSuspended {
        Suspend(0)
        ToolTip("Hotkeys Enabled")
        SetScrollLockState("AlwaysOff")
        Sleep(1000)
        ToolTip("")
    } else {
        Suspend(1)
        ToolTip("Hotkeys Suspended")
        SetScrollLockState("AlwaysOn")
        Sleep(1000)
        ToolTip("")
    }
}
#SuspendExempt

#+r:: {
    ToolTip("Reiniciando...")
    Sleep(500)
    Reload
}

#^r::
{
    if !A_IsAdmin {
        Tooltip("Mudando para o Modo Administrador...")
        Sleep(1000)
        Tooltip("")
        try {
            Run("*RunAs " A_ScriptFullPath)
            ExitApp()
        } catch {
            Tooltip("Operação cancelada.")
            Sleep(1000)
            Tooltip("")
        }
    } else {
        Tooltip("Mudando para o Modo Normal...")
        Sleep(1000)
        Tooltip("")
        RunAsUser(A_ScriptFullPath)
        ExitApp()
    }
}

#^g::
{
    Run("https://github.com/Asteriuz/AutoPC")
    KeyWait("g")
}
