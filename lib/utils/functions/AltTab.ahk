#Requires AutoHotkey v2.0

filePath := A_ScriptDir "\lib\utils\data\hiddenWindows.txt"

RemoveFromAltTab(winTitle) {
    hwnd := WinExist(winTitle)
    if !hwnd {
        MsgBox "Janela não encontrada: " winTitle
        return
    }

    WS_EX_APPWINDOW := 0x00040000
    WS_EX_TOOLWINDOW := 0x00000080

    oldStyle := WinGetExStyle(hwnd)
    newStyle := (oldStyle & ~WS_EX_APPWINDOW) | WS_EX_TOOLWINDOW
    WinSetExStyle(newStyle, "ahk_id " hwnd)

    FileAppend(hwnd "`n", filePath)

    winName := WinGetTitle(hwnd)

    ToolTip("Janela escondida: " winName)
    Sleep 1000
    ToolTip("")

}

ShowInAltTabFromFile() {
    global filePath
    if !FileExist(filePath) {
        ToolTip("Nenhuma janela oculta.")
        Sleep(1000)
        ToolTip("")
        return
    }

    ToolTip("Restaurando janelas ocultas...")

    WS_EX_APPWINDOW := 0x00040000
    WS_EX_TOOLWINDOW := 0x00000080

    Loop Read, filePath {
        hwnd := A_LoopReadLine
        if WinExist("ahk_id " hwnd) {
            oldStyle := WinGetExStyle("ahk_id " hwnd)
            newStyle := (oldStyle & ~WS_EX_TOOLWINDOW) | WS_EX_APPWINDOW
            WinSetExStyle(newStyle, "ahk_id " hwnd)
            WinShow("ahk_id " hwnd)
        }
    }

    Sleep 500
    ToolTip("")
    FileDelete filePath
}