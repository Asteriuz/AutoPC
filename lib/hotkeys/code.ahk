#Requires AutoHotkey v2.0

#HotIf WinActive("ahk_exe Code.exe")
#+d:: {
    Run("python " . A_ScriptDir . "\lib\utils\python\terminal.py", , "hide")
    KeyWait("d")
}

^!.:: {
    Send("^!{.}")
    run("python " . A_ScriptDir . "\lib\utils\python\panel.py", , "hide")
}

^!s:: {
    Send("^!s")
    run("python " . A_ScriptDir . "\lib\utils\python\auto-save.py", , "hide")
}
#HotIf

#c::
{
    if (WinActive("ahk_exe explorer.exe")) {
        explorerpath := GetActiveExplorerTab()
        Sleep(150)
        RunAsUser(VsCode . " " . explorerpath)
        KeyWait("c")
    }
    else {
        RunAsUser(VsCode)
    }
}
