#Requires AutoHotkey v2.0

ToggleHiddenFiles() {
    hiddenFile := RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden")

    if (hiddenFile = 2) {
        RegWrite(1, "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
            "Hidden")
    } else {
        RegWrite(2, "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
            "Hidden")
    }

    Send("{F5}")
}

ExplorerNewTab(path) {
    if hwnd := WinExist("ahk_exe explorer.exe ahk_class CabinetWClass") {
        if !WinActive("ahk_id" hwnd) {
            WinActivate()
            WinWaitActive()
        }
    } else {
        Run(path)
        return
    }
    Send("^t")
    Sleep(250)
    Window := ComObject("Shell.Application").Windows
    idx := Window.Count - 1
    last := Window(idx)
    last.navigate(path)
}

GetActiveExplorerTab(hwnd := WinExist("A")) {
    activeTab := 0
    try activeTab := ControlGetHwnd("ShellTabWindowClass1", hwnd) ; File Explorer (Windows 11)
    catch
        try activeTab := ControlGetHwnd("TabWindowClass1", hwnd) ; IE
    for w in ComObject("Shell.Application").Windows {
        if w.hwnd != hwnd
            continue
        if activeTab { ; The window has tabs, so make sure this is the right one.
            static IID_IShellBrowser := "{000214E2-0000-0000-C000-000000000046}"
            shellBrowser := ComObjQuery(w, IID_IShellBrowser, IID_IShellBrowser)
            ComCall(3, shellBrowser, "uint*", &thisTab := 0)
            if thisTab != activeTab
                continue
        }
        switch type(w.Document) {
            case "ShellFolderView":
                return w.Document.Folder.Self.Path
            default: ;case "HTMLDocument":
                return w.LocationURL
        }
    }
}

isViewingFolder() {
    hwnd := ControlGetFocus("ahk_class CabinetWClass")
    if hwnd {
        className := WinGetClass(hwnd)
        return !(className = "Edit" or className = "Microsoft.UI.Content.DesktopChildSiteBridge")
    }
    return false
}
