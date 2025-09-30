#Requires AutoHotkey v2.0

^q:: {
    if !IsFullscreen() {
        hwnd := WinActive("A")
        if hwnd {
            WinClose(hwnd)
        }
    }
    KeyWait("q")
}

^+q:: {
    Send("!{F4}")
    KeyWait("q")
}

#b::
{
    RunAsUser(ShortcutsPath . "Vivaldi", "--profile-directory=Default")
    KeyWait("b")
}

#+b::
{
    RunAsUser(ShortcutsPath . "VivaldiPrivate", "--incognito")
    KeyWait("b")
}

#^c::
{
    RunAsUser("calc")
    KeyWait("c")
}

#^d:: {
    RunAsUser(ShortcutsPath . "Discord")
    KeyWait("d")
}

#t:: {
    RunAsUser(ShortcutsPath . "qBittorrent")
    KeyWait("t")
}

#u:: {
    RunAsUser(ShortcutsPath . "UniGetUi")
    KeyWait("u")
}

#w:: {
    RunAsUser("whatsapp:")
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
