; + 	Shift
; ^ 	Control
; # 	Win (Windows logo key)
; ! 	Alt

#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, RegEx


#j::Send {LWin up}{LWin}

; Testing
+!d::Send ^{Esc}


; Super+J          | Launcher application finder
; #j::Send {LWin up}^{Esc}
; #j::Send {LWin up}{LWin}
; #j::run, "C:\Program Files (x86)\Launchy\Launchy.exe" /show
