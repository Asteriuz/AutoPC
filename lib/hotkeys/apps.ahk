#Requires AutoHotkey v2.0

#b::
{
    RunAsUser(ShortcutsPath . "Firefox")
    KeyWait("b")
}

#^b::
{
    RunAsUser(ShortcutsPath . "FirefoxPrivate")
    KeyWait("b")
}

#^d:: {
    RunAsUser(ShortcutsPath . "Discord")
    KeyWait("d")
}

#t:: {
    RunAsUser(ShortcutsPath . "qBittorrent")
    KeyWait("t")
}

#w::
{
    RunAsUser(ShortcutsPath . "WhatsApp")
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
        RunAsUser(ShortcutsPath . "Wallpaper Engine")
    KeyWait("w")
}

#^c::
{
    RunAsUser("calc")
    KeyWait("c")
}
