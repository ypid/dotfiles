; + 	Shift
; ^ 	Control
; # 	Win (Windows logo key)
; ! 	Alt


; Ctrl+Alt+A    | Tile window on the left, View split on left
; ^!a::WinMove, 0, 0 ; Move the window found by WinWait to the upper-left corner of the screen.


; Ctrl+Alt+F    | Toggle fullscreen mode
/*  YABT - Yet Another Borderless-Window Toggle
 *  by Barrow (March 30, 2012)
 *  rewritten by kon (May 16, 2014)
 *  http://www.autohotkey.com/board/topic/78903-yabt-yet-another-borderless-window-toggle/page-2#entry650488
 *  updated by Hastarin (Dec 5, 2014)
 *  tested with AutoHotkey v1.1.16.05
 */
^!f::Toggle_Window(WinExist("A"))    ; Win+W to maximize the active window
; !^w::Toggle_Window()                ; Ctrl+Alt+W to maximize the window under the mouse

Toggle_Window(Window:="") {
    static A := Init()
    if (!Window)
        MouseGetPos,,, Window
    WinGet, S, Style, % (i := "_" Window) ? "ahk_id " Window :  ; Get window style
    if (S & +0xC00000) {                                        ; If not borderless
        WinGet, IsMaxed, MinMax,  % "ahk_id " Window
        if (A[i, "Maxed"] := IsMaxed = 1 ? true : false)
            WinRestore, % "ahk_id " Window
        WinGetPos, X, Y, W, H, % "ahk_id " Window               ; Store window size/location
        for k, v in ["X", "Y", "W", "H"]
            A[i, v] := %v%
        Loop, % A.MCount {                                      ; Determine which monitor to use
            if (X >= A.Monitor[A_Index].Left
            &&  X <  A.Monitor[A_Index].Right
            &&  Y >= A.Monitor[A_Index].Top
            &&  Y <  A.Monitor[A_Index].Bottom) {
                WinSet, Style, -0xC00000, % "ahk_id " Window    ; Remove borders
		WinSet, Style, -0x40000, % "ahk_id " Window    ; Including the resize border
                ; The following lines are the x,y,w,h of the maximized window
                ; ie. to offset the window 10 pixels up: A.Monitor[A_Index].Top - 10
                WinMove, % "ahk_id " Window,
                , A.Monitor[A_Index].Left                               ; X position
                , A.Monitor[A_Index].Top                                ; Y position
                , A.Monitor[A_Index].Right - A.Monitor[A_Index].Left    ; Width
                , A.Monitor[A_Index].Bottom - A.Monitor[A_Index].Top    ; Height
                break
            }
        }
    }
    else if (S & -0xC00000) {                                           ; If borderless
	WinSet, Style, +0x40000, % "ahk_id " Window    		; Reapply borders
        WinSet, Style, +0xC00000, % "ahk_id " Window
        WinMove, % "ahk_id " Window,, A[i].X, A[i].Y, A[i].W, A[i].H    ; Return to original position
        if (A[i].Maxed)
            WinMaximize, % "ahk_id " Window
        A.Remove(i)
    }
}

Init() {
    A := {}
    SysGet, n, MonitorCount
    Loop, % A.MCount := n {
        SysGet, Mon, Monitor, % i := A_Index
        for k, v in ["Left", "Right", "Top", "Bottom"]
            A["Monitor", i, v] := Mon%v%
    }
    return A
}


; Ctrl+Alt+W    | Maximize window
; Ctrl+Alt+S    | Restore previous size of window
; Ctrl+Alt+A    | Tile window on the left, View split on left
; Ctrl+Alt+D    | Tile window on the right, View split on right

; Script to allow positioning of windows based on quadrants of the current monitor
; https://autohotkey.com/board/topic/108780-move-window-to-half-quarter-of-current-monitor/

^!w::WinMaximize A

^!s::
	MoveIt(2)
	return

^!a::
	MoveIt(4)
	return

^!d::
	MoveIt(6)
	return

MoveIt(Q)
{
  ; Get the windows pos
	WinGetPos,X,Y,W,H,A,,,
	WinGet,M,MinMax,A

  ; Calculate the top center edge
  CX := X + W/2
  CY := Y + 20

;  MsgBox, X: %X% Y: %Y% W: %W% H: %H% CX: %CX% CY: %CY%

  SysGet, Count, MonitorCount

  num = 1
  Loop, %Count%
  {
    SysGet, Mon, MonitorWorkArea, %num%

    if( CX >= MonLeft && CX <= MonRight && CY >= MonTop && CY <= MonBottom )
    {
		MW := (MonRight - MonLeft)
		MH := (MonBottom - MonTop)
		MHW := (MW / 2)
		MHH := (MH / 2)
		MMX := MonLeft + MHW
		MMY := MonTop + MHH

		if( M != 0 )
			WinRestore,A

		if( Q == 1 )
			WinMove,A,,MonLeft,MMY,MHW,MHH
		if( Q == 2 )
			WinMove,A,,MonLeft,MMY,MW,MHH
		if( Q == 3 )
			WinMove,A,,MMX,MMY,MHW,MHH
		if( Q == 4 )
			WinMove,A,,MonLeft,MonTop,MHW,MH
		if( Q == 5 )
		{
			if( M == 0 )
				WinMaximize,A
			else
				WinRestore,A
		}
		if( Q == 6 )
			WinMove,A,,MMX,MonTop,MHW,MH
		if( Q == 7 )
			WinMove,A,,MonLeft,MonTop,MHW,MHH
		if( Q == 8 )
			WinMove,A,,MonLeft,MonTop,MW,MHH
		if( Q == 9 )
			WinMove,A,,MMX,MonTop,MHW,MHH
        return
    }

    num += 1
  }

return
}

; Ctrl+Super+S     | Launch program `x-terminal-emulator`
; ^#s::Run cmd.exe
^#s::Run C:\Program Files\ConEmu\ConEmu64.exe

; Shift+Super+A    | Launch program `gnome-calculator`
; Not working. Seems to be predefined with "take a screenshot".
; +#a::Run calc.exe

; Ctrl+Alt+V       | `poweroff`
^!v::
MsgBox, 1,, Self destruct sequence initiated. Please confirm.
IfMsgBox, OK
{
  Shutdown, 1
}
return

; Ctrl+Alt+G       | `reboot`
^!g::
MsgBox, 1,, Self destruct/reset sequence initiated. Please confirm.
IfMsgBox, OK
{
  Shutdown, 2
}
return

; Super+J          | Launcher application finder
#j::Send ^{Esc}

; Ctrl+Super+[Level4 Shift][special-keys] | Volume down by 5 %
^#>::SoundSet -5
; Ctrl+Super+Y                            | Volume up by 5 %
^#y::SoundSet +5
; Ctrl+Super+X                            | Mute
^#x::Send {Volume_Mute}

; Not working ...
; #IfWinActive ahk_exe conemu64.exe
; #If WinActive("ahk_class VirtualConsoleClass")
; ^u::MsgBox You pressed Win+Spacebar in Notepad.
; !m::Send !1
; #If

; Ctrl+Super+A  | Lock screen
^#a::DllCall("LockWorkStation")


; Unfortunately, this does not work together with neo-vars.

; ::btw::
; MsgBox You typed "btw".
; return

; :*:!em::[myemailaddress@abc.xyz]
; :c*:jj::john@somedomain.com ; Case sensitive and "ending character not required"..
