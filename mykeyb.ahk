#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Remap missing keys to Chromebook mappings.
; Alt+Up - PgUp, Alt+Down - PgDn
; Ctrl+Alt+Up - Home, Ctrl+Alt+Down - End
; Alt+BckSpc - delete next
!Up::Send {PgUp}
!Down::Send {PgDn}
^!Up::Send {Home}
^!Down::Send {End}
!BS::Del

; Disable Ctrl+Alt+Left/Right in Windows - will rotate screen, blah!
^!Left::Send {Left}
^!Right::Send {Right}

; Add missing Chromebook keys ;-)
; Del is at position of lock key, so it may not be used. Use Ctrl+Alt+BckSpc
; Ctrl+Del or Ctrl+Alt+BckSpc - Ins
^!BS::Ins
!Del::Ins

; Use Ctrl+M to switch to virtual Xubuntu session.
#WinActivateForce
^M::WinActivate, Xubuntu

; Remap Mac BT keyboard - remap media/browser buttons to F-keys,
; remap Ctrl+Shift+Fn to media/browser buttons.
Browser_Home::F1
Browser_Search::F2
Media_Prev::F3
Media_Play_Pause::F4
Media_Next::F5
Volume_Mute::F6
Volume_Down::F7
Volume_Up::F8
; ^+F1::SendInput {Browser_Home}
; ^+F2::SendInput {Browser_Search}
; ^+F3::SendInput {Media_Prev}
; ^+F4::SendInput {Media_Play_Pause}
; ^+F5::SendInput {Media_Next}
^+F6::SendInput {Volume_Mute}
^+F7::SendInput {Volume_Down}
^+F8::SendInput {Volume_Up}

; Remap both win keys to Alt (there are too close to my Alt buttons
; and it is very annoying).
RWin::Alt
LWin::Alt