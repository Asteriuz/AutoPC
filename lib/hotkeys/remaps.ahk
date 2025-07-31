; Requires AutoHotkey v2.0 or later
#Requires AutoHotkey v2.0

; Permanently set the CapsLock key to its "off" state.
SetCapsLockState "AlwaysOff"

; Define the hotkey for CapsLock. The asterisk (*) prefix ensures it
; fires even if other modifiers like Shift or Alt are held down.
*CapsLock::
{
    ; When CapsLock is pressed, the script sends a "Ctrl Down" event.
    Send "{Ctrl Down}"
    
    ; The script then waits for you to physically release the CapsLock key.
    KeyWait "CapsLock"
    
    ; Once CapsLock is released, a "Ctrl Up" event is sent.
    Send "{Ctrl Up}"
    
    ; This is the crucial part. The script checks if the last hotkey
    ; triggered was this one. If you held CapsLock and pressed another key
    ; (e.g., "C"), the prior hotkey would have been "^c" (Ctrl+C).
    ; If you just tapped and released CapsLock, the prior key remains "CapsLock".
    if (A_PriorKey = "CapsLock")
    {
        ; If no other key was pressed, it was a tap. Send "Esc".
        Send "{Esc}"
    }
}