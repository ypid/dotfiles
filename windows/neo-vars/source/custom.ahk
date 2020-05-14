; + 	Shift
; ^ 	Control
; # 	Super (Windows logo key)
; ! 	Alt

;; Get local facts/details about environment {{{
;; https://autohotkey.com/board/topic/149617-windows-10-a-osversion/?p=733130
global A_OSMajorVersion := DllCall("GetVersion") & 0xFF
;; }}}

;; Helper functions {{{

;; Source: https://www.autohotkey.com/boards/viewtopic.php?t=59466
RegExEsc(String, Options := "") {
    if (Options == "$") {
	;; To be used with "RegExReplace" third parameter! ("$$" represents one literal "$").
        string_with_re_meta_char_escaped := RegExReplace(String, "\$", "$$$$")
    } else {
	;; To be used with "RegExMatch" and "RegExReplace" second parameters! ("\\" represents one literal "\").
        string_with_re_meta_char_escaped := "\E\Q" RegExReplace(String, "\\E", "\E\\E\Q") "\E"
    }

    return string_with_re_meta_char_escaped
}

;; }}}

;; Copy clean file/directory path to clipboard (use forward slashes as file separators) {{{
;; https://stackoverflow.com/questions/1589930/so-what-is-the-right-direction-of-the-paths-slash-or-under-windows/1589959#1589959

;; WARNING: This clipboard substitution has the issue that after the substitution, pasting the file does not work anymore!!
;; Because of this, we don’t run the substitution OnClipboardChange globally but only when we consider it safe and otherwise using a (manual) shortcut.
;; Situations where we know it is safe:
;; * Double Commander calls CopyFullNamesToClip.
;; * Location bar in Explorer has focus. See limitations below!

;; The expected workflow is:
;; 1. Do what you usually do to copy a path.
;; 2. We try to do what is necessary to have a clean path in the clipboard.
;; 3. If we cannot do it by default (we don’t know that it is safe), we do nothing and you have to manually make the path in the clipboard clean by pressing Shift+Super+C.

;; Ref: Get-CleanPath in ../../MS_Shell/Modules/ypidDotfiles/ypidDotfiles.psm1
;; Seems up to and including Windows 10, UNC paths with forward slashes don’t work.
;; At least //files.example.org/home and \\files.example.org/home and //files.example.org\home don’t work.
;; Note: This function exists in multiple files and even languages (Lua, AHK). Refer to the AHK implementation for details. AHK is considered the reference implementation.
clean_path_in_clipboard() {
    EnvGet, home_dir_path, USERPROFILE
    Clipboard := RegExReplace(Clipboard, "^" RegExEsc(home_dir_path), "%USERPROFILE%")
    If (RegExMatch(Clipboard, "^(?i)(?:[a-z]:|%[^%]+%)?\\[^\\]")) {
        StringReplace, Clipboard, Clipboard,\,/, All
    }
    Return
}

;; Shift+Super+C | Clean file/directory path in clipboard {{{
+#C::
    ; ClipSaved := ClipboardAll
    ; Clipboard = 

    ; Send ^c
    ;; Ensure that we are only working on text.
    ; ClipWait

    ; currentPath =
    ; WinGetClass explorerClass, A
    ; ControlGetText currentPath, Edit1, ahk_class %explorerClass%
    ; msgbox %currentPath%

    ; If (ErrorLevel) {
    ;     Clipboard := ClipSaved
    ;     MsgBox, 48, Clipboard copy warning, Failed to copy to clipboard.
    ;     Return
    ; }

    clean_path_in_clipboard()
Return
;; }}}

;; Shift+Alt+C | Hook Everything copy path.
;; We can "safely" do this because here, the user wants to copy the path as text.
#UseHook
#IfWinActive ahk_exe Everything\.exe
+!c::
    Send +!c
    clean_path_in_clipboard()
Return
#IfWinActive
#UseHook off

OnClipboardChange:
    ;; Fix file path when in transit in Explorer
    ;; Ensure that we are only working on text.
    If (WinActive("ahk_exe (?i)(?:explorer\.exe)") and A_EventInfo == 1) {

        ;; Location bar in Explorer has focus.
        ;; Run clean_path_in_clipboard after copying text to clipboard in Explorer when cursor is above "Location bar" known as Edit1 (bad programming/variable naming M$??).
        ;; Technically this is not 100 % bulletproof because you could do the copy to clipboard with Ctrl+L followed Ctrl+C while the cursor focuses some other control.
        If (WinActive("ahk_exe (?i)(?:explorer\.exe)")) {
            MouseGetPos, , , , control_below_cursor
            If (control_below_cursor == "Edit1") {
                clean_path_in_clipboard()
            }
        }

        ;; We cannot do this globally, see WARNING above.
        ; clean_path_in_clipboard()
    }
return

;; }}}


;; Force Windows to behave like GNU/Linux {{{

;; GNU/Linux Alt+Window drag functionality {{{
;; This script modified from the original: http://www.autohotkey.com/docs/scripts/EasyWindowDrag.htm
;; by The How-To Geek
;; http://www.howtogeek.com
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
;; }}}

;; }}}


;; Sound and Media {{{

;; Ctrl+Super+[Level4 Shift][special-keys] | Volume down by 5 % {{{
;; Does not work because the >< key is intercepted by Neo2.
;; Implemented in ./varsfunctions.ahk
; ^#>::SoundSet -5
;; }}}

;; Ctrl+Super+Y | Volume up by 5 % {{{
^#y::SoundSet +5
;; }}}

;; Ctrl+Super+X | Mute {{{
^#x::Send {Volume_Mute}
;; }}}

;; }}}

;; Ctrl+Super+A | System -> Lock screen {{{
^#a::DllCall("LockWorkStation")
;; }}}

;; Shift+Alt+A | Typing -> Switch to next input source (e.g. qNeo2 and qwertz) {{{
+!a::
    Suspend, Permit
    Traytogglesuspend()
return
;; }}}

;; Windows {{{

;; Super+Q | Close window {{{
#q::WinClose, A
;; }}}

;; Ctrl+Alt+F | Toggle fullscreen mode {{{
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
;; }}}

;; Ctrl+Alt+[WASD] | Maximize window, restore, tile left/right {{{
;; Ctrl+Alt+W    | Maximize window
;; Ctrl+Alt+S    | Restore previous size of window
;; Ctrl+Alt+A    | Tile window on the left, View split on left
;; Ctrl+Alt+D    | Tile window on the right, View split on right

;; Script to allow positioning of windows based on quadrants of the current monitor
;; https://autohotkey.com/board/topic/108780-move-window-to-half-quarter-of-current-monitor/

^!w::WinMaximize, A
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

    ; MsgBox X: %X% Y: %Y% W: %W% H: %H% CX: %CX% CY: %CY%

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
;; }}}

;; }}}

;; Disable reserved shortcuts globally (Qubes OS) {{{

;; This is to prevent me from accidentally start using reserved shortcuts.
;;
;; Showing a MsgBox if the shortcut is pressed is not a good idea because
;; I might press it accidentally during copy paste because I am used to Qubes OS.
;; I could try to differentiate if the shortcut is pressed accidentally or is
;; being assigned to a new action by checking if the clipboard has recently been
;; modified (or A_TimeSincePriorHotkey).
;; But this only really works for Shift+Ctrl+C. So I take the risk of assigning
;; Shift+Ctrl+[CV]. I hope I won’t or at least I will soon realize the mistake.

; +^C::
; +^V::Return
; +^V::MsgBox, 48, qNeo2_ypid_custom reserved shortcut warning, Use of reserved shortcut detected and blocked. Please use a different shortcut.

;; }}}

;; Custom global shortcuts {{{

;; Ctrl+Super+S | Launch program `x-terminal-emulator` {{{
; ^#s::Run cmd.exe
^#s::Run C:/Program Files/ConEmu/ConEmu64.exe
;; }}}

;; Shift+Super+A | Launch program `gnome-calculator` {{{
;; Not working. Seems to be predefined with "take a screenshot".
; +#a::Run calc.exe
;; }}}

;; Ctrl+Alt+V | `poweroff` {{{
^!v::
    MsgBox, 1,, Self-destruct sequence initiated. Please confirm.
    IfMsgBox, OK
    {
        Shutdown, 1
    }
Return
;; }}}

;; Ctrl+Alt+G | `reboot` {{{
^!g::
    MsgBox, 1,, Self-destruct/reset sequence initiated. Please confirm.
    IfMsgBox, OK
    {
        Shutdown, 2
    }
Return
;; }}}

;; Super+J | Launcher application finder {{{
; #j::Send {LWin up}^{Esc}
; #j::Send {LWin up}{LWin}
; #j::run, "C:/Program Files (x86)/Launchy/Launchy.exe" /show
;; }}}

;; Ctrl+Alt+Q | Show Neo2 keyboard layout {{{
^!q::CharProc__BSTt(false)
;; }}}

;; Super+[IO] | Move panel/taskbar to the top/bottom {{{
;; Super+I | Move panel/taskbar to the top
;; Super+O | Move panel/taskbar to the bottom
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
;; }}}

;; Paste string to application window that does not support clipboard pasting {{{
;; Examples: VM, desktop sharing, websites which block pasting.

;; https://gist.github.com/ethack/110f7f46272447828352768e6cd1c4cb
;; Super + v
; #v::Send {Raw}%Clipboard%

;; Shift+Super + v
+#v::
    InputBox, string_to_paste, Secret string to paste, Please enter a secret string to paste into the active window behind this input box. The string will be represented as stars., hide, 300, 200
    If !ErrorLevel {
        ; WinActivate
        ;; Give window switching a bit of time to paste for the Window below the input box.
        Sleep 100
        Send %string_to_paste%
    }
Return

;; Shift+Super+Alt + v
+#!v::
    InputBox, string_to_paste, String to paste, Please enter a string to paste into the active window behind this input box, , 300, 150
    If !ErrorLevel {
        ; WinActivate
        ;; Give window switching a bit of time to paste for the Window below the input box.
        Sleep 100
        Send %string_to_paste%
    }
Return
;; }}}

;; }}}


;; Application specific {{{

;; Fix Explorer Ctrl+L behavior on Windows 7 {{{
;; Note that the Alt+E is rather uncommon for `focus location bar`. Ctrl+L is the de facto standard on GNU/Linux.
;; Microsoft also finally started accepting this with Windows 10.
;; Lets implement this also for older versions of Windows here.

explorer_focus_location_bar() {
    If (A_OSMajorVersion >= 10) {
        Send, ^l
    } else {
        Send, !e
    }
}

; #If something
;; Does not work???
;
;; So we just exploit the fact that on Windows 7 (and probably below),
;; Microsoft called their exe stupidly (and depend on the fact that Autohotkey matching is case sensitive):
;
;; Does not work on Windows 7 for some stupid reason when it is compiled by 1.1.24.02.
; #IfWinActive, ahk_exe Explorer.EXE
; ^l::Send, !e
; #IfWinActive
;
;; Use this one which has the not so nice part that it also executes on
;; versions where it is not needed:
#IfWinActive, ahk_exe (?i)explorer\.exe
^l::explorer_focus_location_bar()
#IfWinActive
;; }}}

;; Make Explorer behave like Double Commander where possible when we don’t have the real thing {{{
;; Poor mans Double Commander, ref: ../../../docs/shortcuts.md
#IfWinActive, ahk_exe (?i)explorer\.exe
+^s::
    explorer_focus_location_bar()
    Send, powershell{Enter}
Return

^p::Send, {F2}
+!e::Send, !{Enter}
^f::Send, +^n
^o::Send, {Enter}
+^o::Send, +{F10}

;; Credits go to turnersd.
;; https://www.howtogeek.com/howto/keyboard-ninja/keyboard-ninja-toggle-hidden-files-with-a-shortcut-key-in-windows/
^.::
    ;; Path separator must be "\". Last tested 2019-01.
    RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden 
    If (HiddenFiles_Status = 2) {
        RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1 
    } Else {
        RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2 
    }

    ; WinGetClass, eh_Class,A 
    ; If (eh_Class = "#32770" OR A_OSVersion = "WIN_VISTA") {
    Send, {F5} 
    ; } Else {
    ;     ;; Seems this was for Windows below Vista?
    ;     PostMessage, 0x111, 28931,,, A 
    ;     msgbox done
    ; }
Return


explorer_ensure_no_item_is_selected() {
    ;; Ensure no file is selected. ^{Space} does not work because it toggles the selection.
    ; Send, ^a!ei
    If (A_OSMajorVersion >= 10) {
        Send, !hsn
    } else {
        Send, {Up}{Down}
    }
}

+^A::explorer_ensure_no_item_is_selected()


explorer_edit_file_with_editor() {
    If (A_OSMajorVersion < 10) {
        MsgBox Do it manually!
        Return
    }
    ;; Open context menu. {Menu} does not work on Windows 10 for some reason.
    Send, +{F10}
    ;; "Open with"
    Send, h{Right}
    ;; Attempt to open with Gvim, "Vi Improved".
    Send, v
}

;; https://superuser.com/questions/810352/is-there-a-keyboard-shortcut-to-edit-files-such-as-reg-bat-and-so-on/1240744#1240744
^e::explorer_edit_file_with_editor()
Return

; https://superuser.com/questions/133175/is-there-a-shortcut-for-creating-a-new-file
+^e::
    explorer_ensure_no_item_is_selected()

    InputBox, new_filename, New file name, Please enter the filename for the new file, , 300, 150,,,,, test.txt

    ;; Open context menu.
    Send, +{F10}
    ;; "New", "w" optionally does not work because more programs injected themselves into the context menu.
    Send, {Up}{Up}{Right}
    Send, t
    Send, ^a
    Send, %new_filename%{enter}

    explorer_edit_file_with_editor()
Return

;; https://www.howtogeek.com/howto/8955/make-backspace-in-windows-7-or-vista-explorer-go-up-like-xp-did/
;; TODO: Not working yet?
; #IfWinActive, ahk_class CabinetWClass
; Backspace::
;     ControlGet renamestatus,Visible,,Edit1,A
;     ControlGetFocus focussed, A
;     if(renamestatus != 1 && (focussed="DirectUIHWND3" || focussed=SysTreeView321)) {
;         Send !{Up}
;     } else {
;         msgbox sdf
;         Send {Backspace}
;     }

;; Change view:
;; https://www.intowindows.com/keyboard-shortcuts-to-change-file-explorer-view-in-windows-10/
+^h::Send !p
+^j::Send +^6
+^k::Send +^8
+^l::Send +^1

;; Not working because of neo-vars. Would need to hook into neo-vars the same I already do with Alt+< (switch window, emulates Alt+Tab).
; /::Msgbox, "test"
#IfWinActive
;; }}}

;; Make WinSCP behave like Double Commander where possible when we don’t have the real thing {{{
;; https://winscp.net/eng/docs/ui_commander_key
#IfWinActive ahk_exe WinSCP\.exe
^e::Send {F4}
+^e::Send +{F4}
^p::Send {F2}
^y::Send {F5}
^m::Send {F6}

;; Would need to hook into neo-vars to work.
; ^/::Send {F2}
; ^1::Send ^{F3}
; ^2::Send ^{F4}
; ^3::Send ^{F6}
; ^4::Send ^{F5}
; ^5::Send ^{F7}

^,::Send ^h
+^a::Send +^l
+!s::Send !{F6}
^f::Send {F7}
^d::Send {F8}
+!f::Send {F9}
+!x::Send +^c
+!c::Send ^!c
^.::Send ^!h
^o::Send ^!e
^l::Send +^n
#IfWinActive
;; }}}

;; Duplicate session in Putty based programs. {{{
#IfWinActive, ahk_class (Ki|Pu)TTY
+^n::Send, !{space}d
#IfWinActive
;; }}}

;; Focus Hostname field in Putty based programs. {{{

#IfWinActive, ahk_class ^(Ki|Pu)TTYConfigBox$
^l::Send, !n
#IfWinActive
;; }}}

;; Patch ConEmu’s hardcoded system hotkeys {{{
;; https://conemu.github.io/en/SettingsHotkeys.html Bad!
#IfWinActive, ahk_class VirtualConsoleClass
!m::Send, !1
!,::Send, !2
!.::Send, !3
!j::Send, !4
!k::Send, !5
!l::Send, !6
!u::Send, !7
!i::Send, !8
!o::Send, !9
#IfWinActive
;; }}}

;; Ctrl+F | Search for text in Outlook {{{
;; Common shortcuts for M$ Outlook 365/2016. In my version at work, the "Customize" option is missing so we just do it with AHK.
;; https://support.office.com/en-us/article/customize-keyboard-shortcuts-9a92343e-a781-4d5a-92f1-0f32e3ba5b4d
;; After more research, it turns out that M$ decided to drop basic functionally from their otherwise bloated Outlook 2016.
;; https://social.technet.microsoft.com/Forums/en-US/0fd8e8de-1944-4436-a580-308ab05ac637/outlook-2016-custom-keyboard-shortcuts

;; Outlook, only valid with ALL CAPS stupidity in the executable.
#IfWinActive ahk_exe (?:outlook|OUTLOOK)\.(?:exe|EXE)
^F::Send {F4}
#IfWinActive

;; }}}

;; F5 | Execute/run script in SikuliXIDE {{{
#IfWinActive, SikulixIDE
F5::Send, ^r
#IfWinActive
;; }}}

;; Ctrl+R | Execute/run script in SciTE {{{
;; SciTE can probably configured to do this but I have not found this by a
;; quick Internet search.
#IfWinActive, ahk_class SciTEWindow
^r::Send, {F5}
#IfWinActive
;; }}}

;; Chromium {{{
;; Chromium does not allow to customize shortcuts other than what I found https://github.com/1995eaton/chromium-vim allows.
;; https://productforums.google.com/forum/#!topic/chrome/a_YsNg8xq3c;context-place=forum/chrome
;; https://superuser.com/questions/497526/how-to-customize-google-chrome-keyboard-shortcuts

#IfWinActive ahk_exe (chromium|chrome)\.exe

+^D::+^J

;; Does not work in view-source:. Also has the issue that while in search mode, no links can be clicked.
; ^f::Send /

^d::
       ; Send :
       ; Sleep, 50
       ; Send call scrollPageDown{enter}
       Send ,d
Return
^u::Send ,u
+^w::Send +^t
#IfWinActive

;; }}}

;; mRemoteNG {{{

#IfWinActive mRemoteNG
^l::ControlFocus, Edit1, A
#IfWinActive

;; }}}


;; }}}


;; Testing {{{
;; Not working ...
; #IfWinActive ahk_exe conemu64\.exe
; #If WinActive("ahk_class VirtualConsoleClass")
; ^u::MsgBox You pressed Win+Spacebar in Notepad.
; !m::Send !1
; #If


; Unfortunately, this does not work together with neo-vars.

; ::btw::
; MsgBox You typed "btw".
; return

; :*:!em::[myemailaddress@abc.xyz]
; :c*:jj::john@somedomain.com ; Case sensitive and "ending character not required"..
;; }}}

;; Disabled/deprecated {{{

;; Discourage the use of the regular window switching.
;; No, this is counterproductive. I use the optimized switcher when available
;; but don’t disable the regular one.
; LAlt & Tab::return

;; }}}

;; Examples that need to be changed to be working {{{

;; Example | Paste password, perform_os_login {{{
;; Login at Windows 10 and Windows 7 WM lock screen over TeamViwer or other means of remote control.
;; Shift+Super+D does not work here. Using Shift+Alt+D violates my shortcut name spaces.

perform_os_login() {
        ;; Not needed. It also seems to work with neo2 enabled.
        If WinActive("ahk_class IEFrame") {
                MsgBox Ensure that neo2 is disabled.
        }

        If WinActive("ahk_class VMPlayerFrame") {
                MsgBox VMware PLayer is not supported. Please open the "Web Console".
                Return
        }


        FileReadLine, line, C:/path/to/pw.txt, 1

        ;; Send Escape to wake up Windows 10 sleepy screen.
        ;; Escape would cause issues when logging in as a new user (make the username field empty).
        ; Send {Escape}
        Send {Space}
        Sleep, 500

        ;; Does not help. In the worst case, this snippet will need two runs.
        ; If WinActive("ahk_class IEFrame") {
        ;         Sleep, 500
        ; }

        ;; Ensure the user login prompt is active.
        ;; In case the user switching dialog is open, space selects the first,
        ;; currently logged in user and goes to the login prompt for the
        ;; user.
        ;; Enter would also do that but would cause issues in case the login prompt is already open.
        ;; Space just inserts a space in that case which is cleared in the next step anyway ;-)
        Send {Space}

        ;; Ensure no characters are contained in the password field.
        ;; SendEvent is needed for IEFrame where Send does not work.
        SendEvent ^a
        Send {Delete}

        Send %line%{enter}

        Return
}
;; }}}

;; }}}
