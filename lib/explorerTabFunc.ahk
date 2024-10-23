#Requires AutoHotkey v2.0-a
ExplorerNewTab(path) {
    if hwnd := WinExist("ahk_exe explorer.exe ahk_class CabinetWClass") {
        if !WinActive("ahk_id" hwnd) {
            WinActivate()
            WinWaitActive()
        }
    } else {
        Run(path)
        Return
    }
    Send("^t")
    Sleep(250)
    Window := ComObject("Shell.Application").Windows
    idx := Window.Count - 1
    last := Window(idx)
    last.navigate(path)
}