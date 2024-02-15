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

; Remap Mac BT keyboard - remap media/browser buttons to F-keys,
; remap Ctrl+Shift+Fn to media/browser buttons.
Browser_Home::F1
Browser_Search::F2
Media_Prev::F3
; #IfWinActive ahk_exe Teams.exe
; Media_Play_Pause::^+M
; #IfWinNotActive ahk_exe Teams.exe
Media_Play_Pause::F4
; #IfWinActive
Media_Next::F5
Volume_Mute::F6
Volume_Down::F7
Volume_Up::F8

; Remap both win keys to Alt (there are too close to my Alt buttons
; and it is very annoying).
RWin::Return
LWin::Return

; toggle keyboard
SetDefaultKeyboard(LocaleID){
	Global
	SPI_SETDEFAULTINPUTLANG := 0x005A
	SPIF_SENDWININICHANGE := 2
	Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
	VarSetCapacity(Lan%LocaleID%, 4, 0)
	NumPut(LocaleID, Lan%LocaleID%)
	DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "UPtr", &Lan%LocaleID%, "UInt", SPIF_SENDWININICHANGE)
	WinGet, windows, List
	Loop %windows% {
		PostMessage 0x50, 0, %Lan%, , % "ahk_id " windows%A_Index%
	}
}
ToggleKeyb(){
static KEYB__V := 0
KEYB__V++
KEYB__M:=mod(KEYB__V,2)
if KEYB__M=1
   SetDefaultKeyboard(0x10405) ; Czech
else 
   SetDefaultKeyboard(0x0409) ; english-US
return
}

; Alt+Shift+Space or Ctrl+Shift+Space: toggle Czech and english-US keyboard
#IfWinNotActive ahk_exe VirtualBoxVM.exe
!+Space::ToggleKeyb()
#IfWinNotActive ahk_exe VirtualBoxVM.exe
^+Space::ToggleKeyb()

