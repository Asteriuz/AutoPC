#Requires AutoHotkey v2.0

OnExit(HandleExit)

#^+r:: {
    Process := ComObject("WScript.Shell").Exec("taskkill /F /IM explorer.exe")
    while Process.Status = 0
        Sleep(100)
    Run("explorer.exe")
}

#HotIf A_IsAdmin
LButton::
{
    if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 150) {
        return
    }
    else {
        Click "down"
        KeyWait "LButton"
        Click "up"
    }
}
#HotIf

#HotIf WinActive("ahk_exe onscripter-ru.exe")
XButton2:: {
    SystemCursor("Toggle")
}
#HotIf

#!c:: {
    SystemCursor("Toggle")
}

#F12:: {
    activeWindow := WinActive("A")
    RemoveFromAltTab(activeWindow)
}

#+F12:: {
    ShowInAltTabFromFile()
}

#-::
{
    Send("{Volume_Down}")
}

#=::
{
    Send("{Volume_Up}")
}

#backspace::
{
    Send("{Volume_Mute}")
}

#HotIf not IsFullscreen()
^q:: {
    send("!{F4}")
    KeyWait("q")
}
#HotIf

#+l:: {
    ToolTip("Desligando a tela...")
    Sleep(1000)
    SendMessage(0x112, 0xF170, 2, , "Program Manager")
    ToolTip("")
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
    Sleep(100)
    if (WinActive("ahk_exe explorer.exe")) {
        explorerPath := WinActive("ahk_class Progman") ? "" : GetActiveExplorerTab()
        RunAsUser("wt", explorerPath ? "-d`"" . explorerPath . "`"" : "")
    } else {
        RunAsUser("wt")
    }

    KeyWait("enter")
}

#!enter::
{
    Sleep(100)
    isExplorer := WinActive("ahk_exe explorer.exe")
    isDesktop := isExplorer && WinActive("ahk_class Progman")

    if (isDesktop) {
        RunTerminal()
    } else if (isExplorer) {
        explorerPath := GetActiveExplorerTab()
        RunTerminal("-d`"" . explorerPath . "`"")
    } else {
        RunTerminal()
    }

    KeyWait("enter")
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

#!l::
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
