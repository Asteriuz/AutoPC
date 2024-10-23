SetWorkingDir %A_ScriptDir% 
; #Warn
SendMode Input

; -------------------------------------------------------------------------- ;
;                                  VARIABLES                                 ;
; -------------------------------------------------------------------------- ;

rainha := 0

; -------------------------------------------------------------------------- ;
;                                   HOTKEYS                                  ;
; -------------------------------------------------------------------------- ;

; #Include %A_ScriptDir%\lib\menu.ahk

; InputBox, UserInput, Web Address, Please enter a web address...

; If (ErrorLevel = 1) {
;   return ; Cancel was pressed
; } Else {
;   Run, "C:\Program Files\Google\Chrome\Application\chrome.exe" -incognito https://www.google.com/search?q="%UserInput%"
; }

/*
#   Win
!   Alt
^   Ctrl
+   Shift
*/

#SingleInstance force
; #NoTrayIcon
SetNumlockState, AlwaysOff
;SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

if WinExist("Key Remapper 1.12")
  WinClose, Key Remapper 1.12

~^s::
  #If (!WinActive("ahk_exe Code.exe") && !WinActive("ahk_exe Notepad.exe") && !WinActive("ahk_exe Notepad++.exe"))
    Reload
  #If    return

  #If WinActive("ahk_exe opera.exe")
    !1::
    Run, https://www.youtube.com/
  return
  !2::
    Run, https://web.whatsapp.com
  return
  #If
  return

; #;:: 
; if %rainha% {
;   run, cmd.exe /c taskkill /pid %rainha%,,hide
;   MsgBox, Rainha dormindo
;   ; rainha := ""
; }
; Else {
;   run cmd.exe /c cd C:\Users\augus\Code\Projetos\Rainha\palacio\Scripts & activate & cd C:\Users\augus\Code\Projetos\Rainha & python rainha.py,,hide, rainha
; }
; return

#!;::
; MsgBox, %rainha%
if (PID := ProcessExist(%rainha%))
    MsgBox "Notepad exists and has the Process ID " PID "."
else
    MsgBox "Notepad does not exist."

if %rainha% {
  run, cmd.exe /c taskkill /pid %rainha%,,hide
  MsgBox, Rainha dormindo
  rainha := ""
}
Else {
  run cmd.exe /c cd C:\Users\augus\Code\Projetos\Rainha\palacio\Scripts & activate & cd C:\Users\augus\Code\Projetos\Rainha & python rainha.py,,, rainha
}
return

#l::
  run "C:\Riot Games\League of Legends\LeagueClient.exe"
  run https://www.youtube.com/watch?v=gmE6hdJvpOc&t=1s
return

#w::
  { 
    if WinActive("ahk_exe ui32.exe")
    {
      WinMinimize ahk_exe ui32.exe
    }
    else if WinExist("ahk_exe ui32.exe")
    {
      WinActivate ahk_exe ui32.exe
    }
    else
      run, C:\Program Files (x86)\Steam\steamapps\common\wallpaper_engine\wallpaper32.exe
    keywait, w
  }
return

#Home::run taskmgr.exe
return

#!Home::
  {
    run "C:\Program Files\AutoHotkey\WindowSpy.ahk"
  }
return

#Insert::
  {
    run "C:\Program Files\Microsoft VS Code\Code.exe" "C:\Users\augus\Utilities\Scripts\FinalScript\script.ahk"
    keywait, Insert
  }
return

#If WinActive("ahk_exe Code.exe")
#+d::
Run python C:\Users\augus\Utilities\Scripts\PythonScript\terminal.py ;,, Hide
keywait, d
Return
#If
  return

#If WinActive("ahk_exe Code.exe")
  inputChange := 0
^.::
  Send ^{.}
  if inputChange = 0
    Run python C:\Users\augus\Utilities\Scripts\PythonScript\panel.py 1 ,,Hide
  else
    Run python C:\Users\augus\Utilities\Scripts\PythonScript\panel.py 0 ,,Hide
  inputChange := !inputChange
  keywait, .
Return
#If
return

#BackSpace::SoundSet, +1, , mute
keywait, backspace
return

appmuted := 0
#+BackSpace::
  if appmuted = 0
    Run C:\Users\augus\Utilities\Tools\Path\nircmd.exe setappvolume wallpaper32.exe 1
  else
    Run C:\Users\augus\Utilities\Tools\Path\nircmd.exe setappvolume wallpaper32.exe 0
  appmuted := !appmuted
  keywait, BackSpace
return

;Pause::
;	send ^{CtrlBreak}
;	sleep 500
;	send {CtrlBreak}
;keywait Pause
;return

#d::
  {
    run "C:\Users\augus\Downloads"
    keywait, d
  }
return

#!v::
  {
    run "C:\Users\augus\Videos"
    keywait, d
  }
return

; ^t::
; if WinActive("ahk_exe explorer.exe")
; {
; 	run "C:\Users\augus"
; }
; return

LControl & RAlt::
  {
    Send !{space}
  }
return

; #!m::
; run "C:\Program Files (x86)\REDRAGON Gaming Mouse\RDCfg.exe"
; return

; #!t::
; run "C:\Program Files (x86)\Redragon K552RGB-1 Mechanical Keyboard\Redragon K552RGB-1 Mechanical Keyboard.exe"
; return

#e::
  {
    run "C:\Users\augus"
    keywait, e
  }
return

#c::
  {
    run "C:\Program Files\Microsoft VS Code\Code.exe"
  }
return

#!c::
  {
    run calc
  }
return

; #o::WinSet, AlwaysOnTop, Toggle, A
; return

#b:: 
  {
    Run, https://www.google.com/
    keywait, b
  }
return

#+b:: 
  {
    Run, "C:\Program Files\Google\Chrome\Application\chrome.exe" -incognito
    keywait, b
  }
return

; #u::
;   {
;     ; run, "C:\Program Files\Microsoft VS Code\Code.exe" "C:\Users\augus\Udemy"
;     run, "C:\Program Files\Microsoft VS Code\Code.exe" "C:\Users\augus\Udemy\JavaTypeScript"
;     KeyWait, u
;   }
; Return

#!p::
  {
    run, "C:\Program Files\Microsoft VS Code\Code.exe" "C:\Users\augus\Code\Python\Testes\Testes.py"
    KeyWait, p
  }
Return

#!u::
  {
    run, "C:\Users\augus\Udemy"
    KeyWait, u
  }
Return

#!e::
  {
    Run explorer.exe shell:AppsFolder\microsoft.windowscommunicationsapps_8wekyb3d8bbwe!microsoft.windowslive.mail
    keywait, e
  }
return

#If WinActive("ahk_exe chrome.exe")
^+c::
{
  send {F12}
  keywait, c
}
return
#if

#If !WinActive("ahk_exe League of Legends.exe") && !WinActive("ahk_exe javaw.exe")
  ^q::
  {
    send !{F4}
    keywait, q
  }
return
#if

#n::
  {
    run ms-settings:nightlight
  }
return

#q::
  {
    send !{F4}
    keywait, q
  }
return

#enter:: 
  {
    run, cmd
    keywait, enter
  }
return

#f:: 
  {
    send {F11}
    keywait, f
  }
return

#If WinActive("ahk_exe explorer.exe")
^enter:: 
{
  send {F2}
  keywait, enter
}
return
#if

#-:: 
  {
    Send {Volume_Down} 
  }
return

#=:: 
  {
    Send {Volume_Up} 
  }
return

#s::
  {
    run spotify.exe
  }
return

; #!s::
; {
;   run, 	ms-settings:sound
; }
#!s::
  run, powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile C:\Users\augus\Utilities\Scripts\FinalScript\lib\changeaudio.ps1,, Hide
  keywait, s
return

#!b::
  {
    run, 	ms-settings:bluetooth
  }
return

#!d::
  {
    run, 	ms-settings:storagesense
  }
return

; #!p::
; {
;   run, "C:\Program Files\Microsoft VS Code\Code.exe" "C:\Users\augus\Code\Python"
; }
; return

#!l::
  {
    run, "C:\Users\augus\Utilities\Scripts\PreScripts\screenoff.ahk"
    ; run, "C:\Users\augus\AppData\Roaming\DevCon\devcon.exe" disable HID_DEVICE_SYSTEM_MOUSE,, hide
    ; sleep, 300
    ; SendMessage, 0x112, 0xF170, 2,, Program Manager
    ; Input, SingleKey, L1, {LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause}
    ; run, "C:\Users\augus\AppData\Roaming\DevCon\devcon.exe" enable HID_DEVICE_SYSTEM_MOUSE,, hide
  }
return

ScrollLock::
  if (flag := !flag) {
    MouseGetPos, , , hwnd
    Gui Cursor:+Owner%hwnd%
    BlockInput MouseMove
    DllCall("ShowCursor", Int,0)
    run, "C:\Users\augus\AppData\Roaming\DevCon\devcon.exe" disable HID_DEVICE_SYSTEM_MOUSE,, hide
  } else {
    BlockInput MouseMoveOff
    DllCall("ShowCursor", Int,1)
    run, "C:\Users\augus\AppData\Roaming\DevCon\devcon.exe" enable HID_DEVICE_SYSTEM_MOUSE,, hide
  }
Return

#!a::
  {
    run, "C:\Program Files\WindowsApps\57540AMZNMobileLLC.AmazonAlexa_3.11.1285.0_x64__22t9g3sebte08\Alexa.exe"
  }
return

#h::GoSub,CheckActiveWindow

CheckActiveWindow:
  ID := WinExist("A")
  WinGetClass,Class, ahk_id %ID%
  WClasses := "CabinetWClass ExploreWClass"
  IfInString, WClasses, %Class%
    GoSub, Toggle_HiddenFiles_Display
Return

Toggle_HiddenFiles_Display:
  RootKey = HKEY_CURRENT_USER
  SubKey = Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced

  RegRead, HiddenFiles_Status, % RootKey, % SubKey, Hidden

  if HiddenFiles_Status = 2
    RegWrite, REG_DWORD, % RootKey, % SubKey, Hidden, 1 
  else 
    RegWrite, REG_DWORD, % RootKey, % SubKey, Hidden, 2
  PostMessage, 0x111, 41504,,, ahk_id %ID% ; or Send {AppsKey}e
Return

^+c::
  {
    Send, ^c
    Sleep 50
    Run, https://www.google.com/search?q=%clipboard%
    Return
  }

#!x::
  {
    run, xboxpcapp
  }
return

#p::Suspend
return

#^PrintScreen::
  run "C:\Users\augus\Pictures\Screenshots"
return

#!PrintScreen::
  run "C:\Users\augus\Pictures\Screenshots"
return

#^d::
  run "C:\Users\augus\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk"
return

/* 
#   Win
!   Alt
^   Ctrl
+   Shift
*/

::]help::
  MsgBox, 
  (LTrim
  # - Win
  ! - Alt
  ^ - Ctrl
  + - Shift 
  )
Return

; ***************
; Function Keys
; ***************

; #1:: 
; {
; send {F1}
; keywait, 1
; }
; return

; #2:: 
; {
; send {F2}
; keywait, 2
; }
; return

; #3:: 
; {
; send {F3}
; keywait, 3
; }
; return

; #4:: 
; {
; send {F4}
; keywait, 4
; }
; return

; #5:: 
; {
; send {F5}
; keywait, 5
; }
; return

; #6:: 
; {
; send {F6}
; keywait, 6
; return
; }

; #7:: 
; {
; send {F7}
; keywait, 1
; }
; return

; #8:: 
; {
; send {F8}
; keywait, 1
; }
; return

; #9:: 
; {
; send {F9}
; keywait, 1
; }
; return

; #0:: 
; {
; send {F10}
; keywait, 0
; }
; return

;**********************
;  Text Replacement
;**********************

::]s::&nbsp;
Return

::]hm::augustobb@live.com
return

::]gm::gutocebola@gmail.com
return

::]nome::Augusto Barcelos Barros
Return

;******************************************************************************
;			Computer information
;******************************************************************************
::]id::
  SendInput %A_UserName%
Return

::]ip::
  SendInput %A_IPAddress1%
Return

::]comp::
  SendInput %A_ComputerName%
Return

::]adb::
  SendInput 192.168.15.5:5555
return

;******************************************************************************
;			-* lines
;******************************************************************************
::]-10::----------
Return

::]-20::--------------------
Return

::]-30::------------------------------
Return

::]-40::----------------------------------------
Return

::]-50::--------------------------------------------------
Return

::]*10::**********
Return

::]*20::********************
Return

::]*30::******************************
Return

::]*40::****************************************
Return

::]*50::**************************************************
Return

;******************************************************************************
;			Date/Time Stamps
;******************************************************************************
::]d::
  FormatTime, CurrentDate,, M/d/yyyy
  SendInput %CurrentDate%
Return

::]dl::
  FormatTime, CurrentDate,, dddd, MMMM d, yyyy
  SendInput %CurrentDate%
Return

::]t::
  FormatTime, Time,, H:mm
  sendinput %Time%
Return

::vsf::
  sendinput te amo
Return

;******************************************************************************
;			Programação
;******************************************************************************

::]inp::
  sendinput int(input(""))
return

::]finp::
  sendinput float(input(""))
return

;******************************************************************************
;			Simbolos
;******************************************************************************

::]ohm::
  Send {U+03A9}
return