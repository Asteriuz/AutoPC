#Requires AutoHotkey v2.0

#SuspendExempt
ScrollLock:: {
    if A_IsSuspended {
        Suspend(0)
        TurnOnSound()
        SetScrollLockState("AlwaysOff")
        ToolTip("Modo Ativo")
        Sleep(1000)
        ToolTip("")

    } else {
        Suspend(1)
        TurnOffSound()
        SetScrollLockState("AlwaysOn")
        ToolTip("Modo Suspenso")
        Sleep(1000)
        ToolTip("")
    }
    KeyWait("ScrollLock")
}
#SuspendExempt False

#Insert::
{
    RunAsUser(VsCode, A_ScriptDir . "\AutoPC.ahk")
    KeyWait("Insert")
}

#!Insert::
{
    RunAsUser(VsCode, A_ScriptDir)
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
