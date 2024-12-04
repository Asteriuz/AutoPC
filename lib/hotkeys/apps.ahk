#Requires AutoHotkey v2.0

#b::
{
    Run(ShortcutsPath . "Firefox")
    KeyWait("b")
}

#^b::
{
    Run(ShortcutsPath . "FirefoxPrivate")
    KeyWait("b")
}

#^d:: {
    run(ShortcutsPath . "Discord")
    KeyWait("d")
}

#w::
{
    run(ShortcutsPath . "WhatsApp")
    KeyWait("w")
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
        Run(ShortcutsPath . "Wallpaper Engine")
    KeyWait("w")
}

#^c::
{
    run("calc")
    KeyWait("c")
}
