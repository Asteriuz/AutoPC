#Requires AutoHotkey v2.0

#HotIf WinActive("ahk_class CabinetWClass")
BackSpace:: {
    if isViewingFolder() {
        Send("!{Up}")
        KeyWait("BackSpace")
    } else {
        Send("{Backspace}")
    }
}

!n:: {
    Send("{Alt}{Enter}")
    Sleep(100)
    Send("{Up 3}{Enter}")
    KeyWait("n")
}

^v:: {
    large := 96
    for oWin in ComObject("Shell.Application").Windows
        if WinActive() = oWin.Hwnd {
            if oWin.Document.CurrentViewMode == 1 {
                oWin.Document.CurrentViewMode := 4
            } else {
                oWin.Document.CurrentViewMode := 1
            }
            oWin.Document.IconSize := large
        }
    return
}
#HotIf

#h:: {
    ToggleHiddenFiles()
    KeyWait("h")
}

#e:: {
    ExplorerNewTab(UserPath, True)
    KeyWait("e")
}

#d:: {
    ExplorerNewTab(UserPath . "\Downloads")
    KeyWait("d")
}

#^v:: {
    ExplorerNewTab(UserPath . "\Videos")
    KeyWait("v")
}

#^l:: {
    ExplorerNewTab("shell:RecycleBinFolder")
}

#^PrintScreen:: {
    ExplorerNewTab(UserPath . "\Pictures\Screenshots")
    KeyWait("PrintScreen")
}

#HotIf WinActive("ahk_exe explorer.exe")
^enter::
{
    Send("{F2}")
    KeyWait("enter")
}

#^e:: {
    selectedFile := GetSelectedFile()
    if selectedFile {
        SplitPath(selectedFile, , &fileDir)
        Run('nanazipc e -spf -sps -o"' fileDir '" "' selectedFile '"', , "hide")
    }
    KeyWait("e")
}
#HotIf