#Requires AutoHotkey v2.0

isFullscreen() {

    activeWindow := WinGetID("A")

    screenWidth := A_ScreenWidth
    screenHeight := A_ScreenHeight

    WinGetPos(&x, &y, &width, &height, "ahk_id " activeWindow)

    if (x = 0 && y = 0 && width = screenWidth && height = screenHeight) {
        return true
    } else {
        return false
    }
}
