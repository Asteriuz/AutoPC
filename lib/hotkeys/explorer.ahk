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