/* -------------------------------------------------------------------------- */
/*                                   AutoPC                                   */
/* -------------------------------------------------------------------------- */

/* -------------------------------- Settings -------------------------------- */
#Requires AutoHotkey v2.0-a
#SingleInstance
; #NoTrayIcon
SetNumlockState("AlwaysOff")
SetScrollLockState("AlwaysOff")

/* ---------------------------------- Path ---------------------------------- */
UserPath := EnvGet("UserProfile")
IconPath := A_ScriptDir . "\lib\assets\icons"
UtilsPath := A_ScriptDir . "\lib\utils"
ShortcutsPath := A_ScriptDir . "\shortcuts\"
CodeEditor := ShortcutsPath . "Visual Studio Code"

/* -------------------------------- Functions ------------------------------- */
#Include %A_ScriptDir%\lib\utils\functions\Help.ahk
#Include %A_ScriptDir%\lib\utils\functions\MenuFunctions.ahk
#Include %A_ScriptDir%\lib\utils\functions\ExplorerFunctions.ahk
#Include %A_ScriptDir%\lib\utils\functions\IsFullscreen.ahk
#Include %A_ScriptDir%\lib\utils\functions\Run.ahk
#Include %A_ScriptDir%\lib\utils\functions\Sounds.ahk
#Include %A_ScriptDir%\lib\utils\functions\ToggleCursor.ahk
#Include %A_ScriptDir%\lib\utils\functions\HandleExit.ahk
#Include %A_ScriptDir%\lib\utils\functions\AltTab.ahk

/* ------------------------------ Text Replace ------------------------------ */
#Include %A_ScriptDir%\lib\utils\text-replace.ahk

/* ---------------------------------- Menu ---------------------------------- */
#Include %A_ScriptDir%\lib\menu\style.ahk
#Include %A_ScriptDir%\lib\menu\sound.ahk
#Include %A_ScriptDir%\lib\menu\display.ahk
#Include %A_ScriptDir%\lib\menu\web.ahk
#Include %A_ScriptDir%\lib\menu\fiap.ahk
#Include %A_ScriptDir%\lib\menu\gs.ahk
#Include %A_ScriptDir%\lib\menu\project.ahk
#Include %A_ScriptDir%\lib\menu\explorer.ahk
; #Include %A_ScriptDir%\lib\menu\adobe.ahk

/* --------------------------------- Hotkeys -------------------------------- */
#Include %A_ScriptDir%\lib\hotkeys\manager.ahk
#Include %A_ScriptDir%\lib\hotkeys\windows.ahk
#Include %A_ScriptDir%\lib\hotkeys\remaps.ahk
#Include %A_ScriptDir%\lib\hotkeys\explorer.ahk
#Include %A_ScriptDir%\lib\hotkeys\code.ahk
#Include %A_ScriptDir%\lib\hotkeys\apps.ahk

/* ---------------------------------- JOKER --------------------------------- */
#j:: {
    if !A_IsAdmin {
        MsgBox "AutoHotkey is not running as administrator."
        return
    }
    else MsgBox("AutoHotkey is running as administrator.")

}
