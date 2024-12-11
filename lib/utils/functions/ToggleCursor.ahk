#Requires AutoHotkey v2.0

SystemCursor(cmd) {
    static visible := true, cursors := Map()
    static sysCursors := [32512, 32513, 32514, 32515, 32516, 32642, 32643, 32644, 32645, 32646, 32648, 32649, 32650]

    if (cmd = "Reload" || !cursors.Count) {
        for id in sysCursors {
            hCursor := DllCall("LoadCursor", "ptr", 0, "ptr", id, "ptr")
            hDefault := DllCall("CopyImage", "ptr", hCursor, "uint", 2, "int", 0, "int", 0, "uint", 0, "ptr")
            hBlank := DllCall("CreateCursor", "ptr", 0, "int", 0, "int", 0, "int", 32, "int", 32, "ptr", Buffer(32 * 4,
                0xFF), "ptr", Buffer(32 * 4, 0), "ptr")
            cursors[id] := { default: hDefault, blank: hBlank }
        }
    }

    switch cmd {
        case "Show":
            visible := true
        case "Hide":
            visible := false
        case "Toggle":
            visible := !visible
        default:
            return
    }

    for id, handles in cursors {
        hCursor := DllCall("CopyImage", "ptr", visible ? handles.default : handles.blank, "uint", 2, "int", 0, "int", 0,
            "uint", 0, "ptr")
        DllCall("SetSystemCursor", "ptr", hCursor, "uint", id)
    }
}
