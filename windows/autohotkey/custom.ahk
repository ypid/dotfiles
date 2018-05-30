; + 	Shift
; ^ 	Control
; # 	Super (Windows logo key)
; ! 	Alt

#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, RegEx



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
^!s::MoveIt(2)
^!a::MoveIt(4)
^!d::MoveIt(6)

MoveIt(Q) {
    ; Get the windows pos
    WinGetPos,X,Y,W,H,A,,,
    WinGet,M,MinMax,A

    ; Calculate the top center edge
    CX := X + W/2
    CY := Y + 20

    ; MsgBox, X: %X% Y: %Y% W: %W% H: %H% CX: %CX% CY: %CY%

    SysGet, Count, MonitorCount

    num = 1
    Loop, %Count% {
        SysGet, Mon, MonitorWorkArea, %num%

        if( CX >= MonLeft && CX <= MonRight && CY >= MonTop && CY <= MonBottom ) {
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


; GNU/Linux Alt+Window drag functionality
; This script modified from the original: http://www.autohotkey.com/docs/scripts/EasyWindowDrag.htm
; by The How-To Geek
; http://www.howtogeek.com 
Alt & LButton::
    CoordMode, Mouse  ; Switch to screen/absolute coordinates.
    MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
    WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
    WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
    if EWD_WinState = 0  ; Only if the window isn't maximized 
        SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
    return
    
    EWD_WatchMouse:
    GetKeyState, EWD_LButtonState, LButton, P
    if EWD_LButtonState = U  ; Button has been released, so drag is complete.
    {
        SetTimer, EWD_WatchMouse, off
        return
    }
    GetKeyState, EWD_EscapeState, Escape, P
    if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
    {
        SetTimer, EWD_WatchMouse, off
        WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
        return
    }
    ; Otherwise, reposition the window to match the change in mouse coordinates
    ; caused by the user having dragged the mouse:
    CoordMode, Mouse
    MouseGetPos, EWD_MouseX, EWD_MouseY
    WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
    SetWinDelay, -1   ; Makes the below move faster/smoother.
    WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
    EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
    EWD_MouseStartY := EWD_MouseY
    return


; Super+I | Move panel/taskbar to the top
; Super+O | Move panel/taskbar to the bottom
#I::TaskbarMove("Top")
#O::TaskbarMove("Bottom")
; #Numpad4::TaskbarMove("Left")
; #Numpad6::TaskbarMove("Right")

TaskbarMove(p_pos) {
    label:="TaskbarMove_" p_pos

    WinExist("ahk_class Shell_TrayWnd")
    SysGet, s, Monitor

    if (IsLabel(label)) {
        Goto, %label%
    }
    return

    TaskbarMove_Top:
    TaskbarMove_Bottom:
    WinMove(sLeft, s%p_pos%, sRight, 0)
    return

    TaskbarMove_Left:
    TaskbarMove_Right:
    WinMove(s%p_pos%, sTop, 0, sBottom)
    return
}

WinMove(p_x, p_y, p_w="", p_h="", p_hwnd="") {
    WM_ENTERSIZEMOVE:=0x0231
    WM_EXITSIZEMOVE :=0x0232

    if (p_hwnd!="") {
        WinExist("ahk_id " p_hwnd)
    }

    SendMessage, WM_ENTERSIZEMOVE
    ;//Tooltip WinMove(%p_x%`, %p_y%`, %p_w%`, %p_h%)
    WinMove, , , p_x, p_y, p_w, p_h
    SendMessage, WM_EXITSIZEMOVE
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
; TODO: Not yet always working. The issue is not that Super+J is used to trigger it.
#j::Send ^{Esc}

; Super+Q       | Close window
#q::WinClose, A

; Ctrl+Super+[Level4 Shift][special-keys] | Volume down by 5 %
; Does not work because the >< key is intercepted by Neo2.
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


; Duplicate session in Putty based programs.
#IfWinActive,.*[KP]iTTY
+^n::Send, !{space}d
#IfWinActive
