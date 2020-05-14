# Shortcuts

Here are some common shortcuts that I use and which I configure in every program for which it makes sense and allows to do so. Programs which don’t allow me to configure shortcuts don’t stop me to follow my standards either by patching, opening an issue or as last resort by scripting using AutoKey or AutoHotKey.

## Advises: Shortcuts done right

Here is some advice regarding shortcuts for programmers and UI designers which I would like to see implemented:

* Allow more than one shortcut for one action!
* Allow to reconfigure *everything*.
* Make it easy to track the configuration files (which contain the shortcuts) with version control. This also means not to store the shortcuts together with things that you don‘t want to track (like recent files or usernames and passwords).
* When editing text in an input view then certain shortcuts are expected to work:
  * `Ctrl+A`: Select all
  * `Shift+Ctrl+A`: Select none
  * `Ctrl+Z`: Undo
  * `Shift+Ctrl+Y`: Undo (Maybe worth a thought because it is way easier to reach then Ctrl+Z)
  * `Ctrl+Y`: Redo
  * `Ctrl+U`: Delete line
  * `Ctrl+W`: Delete word
  * `Ctrl+H`: Delete character

* Do not reinvent the wheel!

## Shortcut “Namespaces”

Which shortcuts should be used where? – Some thoughts …

* `Shift+Alt`: W, S, X, A, D reserved for window manager. Applications can use everything else.
* `Super+Alt`: Hypervisor console as host key.
* `Ctrl+Super`, `Super`, `Ctrl+Alt`: Dedicated to window manager respectively shortcuts which can be triggered globally.
  * Never use the `Super` key for applications as this modifier might be reserved in some window managers. (And I don’t want to find out how to patch Windows to remap that).
* `Shift+Super`, `Shift+Super+Alt`: Dedicated to AutoKey or AutoHotKey (global)
    * Can also be used over RDP on Windows machines without interfering with MS Windows mappings of the Super key.
    * Note that `Shift+Super+Alt` is uncomfortable to enter. Only use for less frequent shortcuts.

### Applications

* `Ctrl`: Applications.
* `Shift`: Applications.
* `Shift+Ctrl`: Applications.
* `Shift+Ctrl+Alt`: Applications except Shift+Ctrl+Alt+O.
* `Shift+Alt`: With limitations, see above.

### Avoid

* Remapping `Alt+[A-Z]`

### No goes

* Never map `Alt+<letter>` where letter is a character which is located on the left of a QWERTZ keyboard.

## Free shortcuts

List of free shortcuts (they may have a default mapping but there are better shortcuts for those actions so that the shortcuts are available to be mapped to a different action).

* `Super` (WinKey): Almost forgotten :)
* Super+Alt+C
* Shift+Alt+
* Ctrl+Alt+Y
* Ctrl+Alt+[Level4 Shift][special-keys]
* Ctrl+Alt+E
* Shift+Super+Alt+

## Reserved shortcuts

Shortcuts which are reserved for non-public use at work.

* Shift+Alt+D

## Shortcut conventions and key order

To search for shortcuts, it is important to maintain a unique naming schema and order in which they are combined. This is pretty much based on the convention used by [Double Commander]:

* `Ctrl`
* `Shift`
* `Super`
* `Alt`
* `Non-modifier keys` (Letter, written in upper case for readability. The use of the shift modifier key is explicitly written down.)

### Special keys

Key name      | Comment
------------- | -------------
Level4 Shift  | This key in my configuration is the <> button.
\+            | Separator for keys
anything else | Is either a usual key name or a regular expression to specify a range of keys

## Window manager (e.g. Gnome3 or xfce)

Own shortcuts for the window manager should include the Super key which is normally not used by applications.

### Navigation

Left hand only: Should be easy to use with the left hand, because it is often used during work with the mouse. For example switching windows or Ctrl+C to copy to the clipboard.

Shortcut                           | Function                       | Left hand only | Comment
-------------                      | -------------                  | -------------  | -------------
Alt+[Level4 Shift][special-keys]   | Switch windows                 | Of course      | Easier to reach than Alt+Tab.
Super+[Level4 Shift][special-keys] | Switch to workspace 1          | Of course      | Does not work on M$ Windows or would require Neo2 AHK patch.
Super+Y                            | Switch to workspace 2          | Of course      |
Super+X                            | Switch to workspace 3          | Of course      |
Super+A                            | Switch to workspace 4          | Of course      |
Super+S                            | Switch to workspace 5          | Of course      |
Super+D                            | Switch to workspace 6          | Of course      |
Shift+Alt+W                        | Move window one workspace up   | Yes            | Not supported by windows-desktop-switcher on M$. I could implement it if I would really need it.
Shift+Alt+S                        | Move window one workspace down | Yes            | Not supported by windows-desktop-switcher on M$. I could implement it if I would really need it.
Super+1                            | Move window to workspace 1     | Of course      |
Super+2                            | Move window to workspace 2     | Of course      |
Super+3                            | Move window to workspace 3     | Of course      |
Super+4                            | Move window to workspace 4     | Of course      |
Super+5                            | Move window to workspace 5     | Of course      |
Super+6                            | Move window to workspace 6     | Of course      |

[shellshape]: https://extensions.gnome.org/extension/294/shellshape/

### Sound and Media

Shortcut                                | Function           | Left hand only | Comment
-------------                           | -------------      | -------------  | -------------
Ctrl+Super+[Level4 Shift][special-keys] | Volume down by 5 % | Yes            | `amixer set Master 5%- -q` (`pactl set-sink-volume 0 '-5%'` might not work when a different output is active.)
Ctrl+Super+Y                            | Volume up by 5 %   | Yes            | `amixer set Master 5%+ -q`
Ctrl+Super+X                            | Mute               | Yes            | Using https://askubuntu.com/questions/65764/how-do-i-toggle-sound-with-amixer/757110#757110 which runs in Qubes OS dom0 without `qvm-run` and is instant :)

### System

Shortcut      | Function      | Left hand only | Comment
------------- | ------------- | -------------  | -------------
Ctrl+Super+A  | Lock screen   | Yes            |

### Typing

Shortcut      | Function                                                            | Left hand only | Comment
------------- | -------------                                                       | -------------  | -------------
Shift+Alt+A   | Switch to next input source/keyboard layout (e.g. qNeo2 and qwertz) | Yes            | This needs to be compiled into Neo-vars on Windows.
Shift+Ctrl+U  | Enter Unicode hex value                                             | No             |

### Windows

Shortcut      | Function                                      | Left hand only | Comment
------------- | -------------                                 | -------------  | -------------
Super+Q       | Close window                                  | Yes            | If Ctrl+Q does not work. (Example: gnome-terminal)
Ctrl+Alt+F    | Toggle fullscreen mode                        | Yes            | If Alt+F does not work. Try to use Ctrl+Alt+F because it is more generic. Use Shift+Super+F to emit F11.
Ctrl+Alt+W    | Maximize window                               | Yes            |
Ctrl+Alt+S    | Restore previous size of window               | Yes            |
Ctrl+Alt+A    | Tile window on the left, View split on left   | Yes            |
Ctrl+Alt+D    | Tile window on the right, View split on right | Yes            |

### Qubes OS

Shortcut         | Function             | Left hand only | Comment
-------------    | -------------        | -------------  | -------------
Shift+Ctrl+C     | Qubes Inter VM copy  | Yes            |
Shift+Ctrl+V     | Qubes Inter VM paste | Yes            |

### Custom shortcuts

Shortcut          | Function                                   | Left hand only | Comment
-------------     | -------------                              | -------------  | -------------
Ctrl+Super+S      | Launch program `x-terminal-emulator`       | Yes            |
Shift+Super+A     | Launch program `gnome-calculator`          | Nice to have   |
Ctrl+Super+[1-9]  | Launch custom program or script            | Yes and no     |
Ctrl+Alt+V        | `poweroff`                                 | Yes            |
Ctrl+Alt+G        | `reboot`                                   | Yes            |
Super+J           | Launch application finder (Launcher)       | Nice to have   | Gnome activities or substation for other WMs. Gnome does by default trigger on Super button press which is a nice feature but does not work on other WMs yet?
Super             | Launch application finder (Launcher)       | Yes            | Only works with Gnome (and M$ Windows).
Ctrl+Super+O      | Open contact search for calling, CTI       | No             | Computer Telephony Integration
Shift+Ctrl+Alt+O  | Launch program `eject`                     | No             | Eject removable media, FIXME
Ctrl+Alt+Q        | Show Neo2 keyboard layout                  | Yes            | Mod3+F1 does not work on GNU/Linux (xfce). [Neo Layout Viewer][NeoLayoutViewer].
Super+C           | Start screen recording                     | Yes            | Start screen recording using OBS Studio.
Super+I           | Move panel/taskbar to the top              | Nice to have   | Only needed on Windows because Windows is stupid enough/can not prevent applications from appearing below the Taskbar when it is positioned at the top.
Super+O           | Move panel/taskbar to the bottom           | Nice to have   | See above. Ah, no comment without hating M$ :) Super+L can not be used because there is [no way to disable it under Windows 10](https://superuser.com/questions/1059511/how-to-disable-winl-in-windows-10).
Super+V           | Type clipboard text content to application | Nice to have   | Type clipboard text content to application window that does not support clipboard pasting.
Shift+Super+V     | Type secret string to application window   | Nice to have   | Paste secret string to application window that does not support clipboard pasting.
Shift+Super+Alt+V | Type string to application window          | Nice to have   | Paste string to application window that does not support clipboard pasting.
Shift+Super+C     | Copy clean path to clipboard               | Nice to have   | Use forward slashes as file separators.

[NeoLayoutViewer]: https://github.com/YggdrasiI/NeoLayoutViewer.git

## GUI applications

### Autokey

Here are the shortcuts I use to trigger [autokey][] actions.

#### Emitting keystrokes

The keystrokes are intended for the application and not to be trapped by the window manager.

#### Global

Shortcut      | Function        | Left hand only | Comment
------------- | -------------   | -------------  | -------------
Shift+Super+V | enter           | Yes            | Emit enter. If AltGr+v does not work (unfortunately AltGr can currently not be used in autokey). Unused. Reusing Shift+Super+V for something else.
Shift+Super+M |                 | Yes            | Emits F1. Neo2 numbers.
Shift+Super+, |                 | Yes            | Emits F2. Neo2 numbers.
Shift+Super+. |                 | Yes            | Emits F3. Neo2 numbers.
Shift+Super+J |                 | Yes            | Emits F4. Neo2 numbers.
Shift+Super+R | Reload          | Yes            | Emits F5. Most applications will either reload or go to presentation mode.
Shift+Super+L |                 | Yes            | Emits F6. Neo2 numbers.
Shift+Super+U |                 | Yes            | Emits F7. Neo2 numbers.
Shift+Super+I |                 | Yes            | Emits F8. Neo2 numbers.
Shift+Super+O |                 | Yes            | Emits F9. Neo2 numbers.
Shift+Super+F | F11             | Yes            | Emits F11. Causes most applications to go in fullscreen.

### Clementine

#### Global

Shortcut      | Function                   | Left hand only | Comment
------------- | -------------              | -------------  | -------------
Ctrl+Alt+X    | `clementine --play-pause`  | Of course      | Play or pause audio. Using command line to also allow to start the program if no instance is running.
Shift+Alt+X   | `clementine --next`        | Of course      | Play next audio file
Ctrl+Alt+L    | `clementine --next`        | Of course      | Play next audio file
Ctrl+Alt+H    | `clementine --previous`    | Of course      | Play previous audio file
Ctrl+Alt+B    | `clementine --seek-by -10` | Nice to have   | Seek in audio file by *n* seconds.
Ctrl+Alt+N    | `clementine --seek-by 10`  | Nice to have   | Seek in audio file by *n* seconds.

<!-- Try with later version again.

### Application window only

Clementine - Not worth using global shortcuts for this.

Ctrl+Space | Rate the current song 0 star  | No |
Ctrl+M     | Rate the current song 1 star  | No |
Ctrl+,     | Rate the current song 2 stars | No |
Ctrl+.     | Rate the current song 3 stars | No |
Ctrl+J     | Rate the current song 4 stars | No |
Ctrl+K     | Rate the current song 5 stars | No |

-->

### IDEs

Applies to: SikuliX, SciTE

Shortcut      | Function           | Left hand only | Comment
------------- | -------------      | -------------  | -------------
Ctrl+R        | Execute/run script | Nice to have   | The default seems to be F5 but I prefer easier to reach key combinations.
F5            | Execute/run script | Nice to have   | Fallback in case Ctrl+R is not yet configured for an application.


### Windows and tabs

Applies to: Firefox, Chromium, Double Commander, GNOME Terminal, ConEmu.

For GNOME Terminal (and ConEmu), each shortcut requires additionally the use of the Shift modifier key.

Shortcut       | Function                                | Left hand only | Comment
-------------  | -------------                           | -------------  | -------------
Ctrl+N         | Open new tab                            | No             | Easier to reach than Ctrl+T
Ctrl+W         | Close current tab                       | Of course      | Should be default in all program
Ctrl+T         | Open a new window                       | No             | Not as often used as "new tab", thus switched with it.
Ctrl+Q         | Closes the application                  | Of course      | Should be default in all program. FIXME: Drop this shortcut in favor of Super+Q. Done on: Windows.
Ctrl+Tab       | Switch to right tab, cycle through tabs | Yes            |
Shift+Ctrl+Tab | Switch to left tab, cycle through tabs  | Yes            |
Ctrl+J         | Switch to left tab                      | Not really     |
Ctrl+K         | Switch to right tab                     | Not really     |
Ctrl+[+-]      | Increase/Decrease (zoom) font size      | Nice to have   | Currently not supported in Double Commander. Level 3 [Neo2][] plus and minus work in Firefox (after setting the − via the Add-On Customizable Shortcuts). GNOME Terminal does not allow to configure „−” currently (can this be done in Gtk programs?). Works in ConEmu (without Shift).
Alt+M          | Switch to tab 1                         | No             | See [Neo2 layer4][Neo2]. Maybe blocks the use of Alt+[a-z]. I hope that most applications use letters which would be on the left side of a qwertz keyboard.
Alt+,          | Switch to tab 2                         | No             |
Alt+.          | Switch to tab 3                         | No             |
Alt+J          | Switch to tab 4                         | No             |
Alt+K          | Switch to tab 5                         | No             |
Alt+L          | Switch to tab 6                         | No             |
Alt+U          | Switch to tab 7                         | No             |
Alt+I          | Switch to tab 8                         | No             |
Alt+O          | Switch to tab 9                         | No             |


#### Used keys

* Ctrl + [CDJKNQVWX]

### Browser

Applies to: Firefox, Chromium

Shortcut      | Function                     | Left hand only | Comment
------------- | -------------                | -------------  | -------------
Shift+Ctrl+S  | View page source             | Yes            |
Shift+Ctrl+D  | Web console (d for Debug)    | Yes            | Can not be configured in Chromium as of 
Shift+Ctrl+W  | Undo Close Tab               | Yes            |
Alt+Enter     | Open location bar in new tab | No             |
Ctrl+H        | Open history                 | Not really     |

### Media player

Applies to: SMPlayer, Kodi

Shortcut      | Function                     | Left hand only | Comment
------------- | -------------                | -------------  | -------------
Space         | Play/Pause                   | Yes            |
Del           | Stop playback                | Nice to have   | Two times stop causes SMPlayer to reset the playback position to the beginning.
,             | Previous frame               | Nice to have   |
.             | Next frame                   | Nice to have   |
P             | Previous media in playlist   | Nice to have   |
N             | Next media in playlist       | Nice to have   |
{             | Half speed                   | Nice to have   |
}             | Double speed                 | Nice to have   |
[             | Reduce speed by 0.10         | Nice to have   |
]             | Increase speed by 0.10       | Nice to have   |
Backspace     | Normal speed                 | Nice to have   |
Ctrl+L        | Open Playlist                | Nice to have   |
Ctrl+F        | Fullscreen                   | Not really     |

### ConEmu

ConEmu together with a lot of other "fine tuning" help to make the different shells on M$ somewhat usable.

Shortcut      | Function                               | Left hand only | Comment
------------- | -------------                          | -------------  | -------------
Shift+Ctrl+N  | Opens new vertical split               | No             | As in Tmux Ctrl+A %.
Shift+Ctrl+M  | Opens PowerShell as admin in a new tab | No             |
Shift+Ctrl+I  | Opens CMD in a new tab                 | No             |
Shift+Ctrl+O  | Opens CMD as admin in a new tab        | No             |

##### Application specific

###### Pidgin

Shortcut      | Function                          | Left hand only | Comment
------------- | -------------                     | -------------  | -------------
Ctrl+H        | Change spell check language to de | No             | See [script](/autokey/Emitting keystrokes/Pidgin/Change language in Pidgin to de.py)
Ctrl+L        | Change spell check language to en | No             | See [script](/autokey/Emitting keystrokes/Pidgin/Change language in Pidgin to en.py)

### Firefox

I use [VimFx][] to get all the Vim basics …

To customize Firefox even further I use [Customizable Shortcuts](https://github.com/ttaubert/customizable-shortcuts).

### Chromium

I use [cVim][] to get all the Vim basics and to customize shortcuts.

### Gimp

Shortcut      | Function      | Left hand only | Comment
------------- | ------------- | -------------  | -------------
W             | tools-move    | Yes            |
Shift+Alt+C   | layers-new    | Yes            |
Ctrl+Y        | Undo          | Yes            | Just easier to reach
Shift+Ctrl+Y  | Redo          | Yes            | Just easier to reach

### digiKam

Shortcut      | Function          | Left hand only | Comment
------------- | -------------     | -------------  | -------------
Ctrl+Space    | Rate with 0 stars | No             |
Ctrl+M        | Rate with 1 star  | No             |
Ctrl+.        | Rate with 2 stars | No             |
Ctrl+,        | Rate with 3 stars | No             |
Ctrl+J        | Rate with 4 stars | No             |
Ctrl+K        | Rate with 5 stars | No             |
Ctrl+6        | Set "favor" tag   | No             |
Shift+Ctrl+J  | Thumbnails        | Nice to have   |
Shift+Ctrl+K  | Preview Image     | Nice to have   |
Shift+Ctrl+L  | Light Table       | Nice to have   |
Ctrl+E        | Rotate Left       | Nice to have   |
Ctrl+R        | Rotate Right      | Nice to have   |
Ctrl+D        | Delete (Trash)    | Yes            | Matches Double Commander
Ctrl+[+-]     | Zoom in/out       | Nice to have   | Note that there is a bug in digiKam which requires to unmap other Ctrl+N and Ctrl+L mappings for this one to work. Ref: https://forum.kde.org/viewtopic.php?f=251&t=133208

### VirtualBox and other hypervisors

Shortcut      | Function            | Left hand only | Comment
------------- | -------------       | -------------  | -------------
Super+Alt     | Host key            | Nice to have   |
Host key+M    | Insert Ctrl+Alt+Del | Nice to have   |

### Double Commander (DC)

See the manual for the default shortcuts. I added my own which I think are more convenient.

Note that using `Shift+[A-Z]` currently has side effects when using the RenameOnly function [currently](https://doublecmd.sourceforge.io/mantisbt/view.php?id=973) so I avoid to use `Shift+[A-Z]` for actions.

Hint: [Double Commander] works quite nicely together with [Neo2][] …

* Don’t restrict control to files panel for actions which are shown in the function key buttons area so that DC shows the mapping there too.

When looking for currently unassigned/free shortcuts, Double Commander has an awesome feature which can tell you the unassigend shortcuts. In ConfigHotKeys -> "Add hotkey" -> F1 symbol. Nice idea but seems not to work as of 0.8.4 beta?

#### Assumed to be default

Mappings which are default or which should be default.

Shortcut      | Function       | Left hand only | Comment
------------- | -------------  | -------------  | -------------
Ctrl+A        | MarkMarkAll    | Yes            |
Shift+Ctrl+A  | MarkUnmarkAll  | Yes            | Default behavior from Gimp.
Ctrl+I        | MarkInvert     | Nice to have   | Default behavior from Gimp.
Ctrl+D        | Delete (Trash) | Yes            |
Shift+Ctrl+D  | Delete         | Yes            |

#### Mutable

Shortcut      | Function          | Left hand only | Comment
------------- | -------------     | -------------  | -------------
Ctrl+M        | Move              | Yes            |
Ctrl+P        | RenameOnly        | Not really     |
Shift+Ctrl+R  | MultiRename       | Not really     |
Ctrl+Y        | Copy              | No             |
Shift+Ctrl+V  | CopySamePanel     | No             |
Shift+Alt+E   | FileProperties    | Yes            |
Shift+Alt+S   | Symlink           | Yes            |
Shift+Alt+F   | SetFileProperties | Nice to have   |
Ctrl+F        | MakeDir           | Not really     |
Ctrl+O        | ShellExecute      | Yes            | Open
Shift+Ctrl+O  | ContextMenu       | Yes            | Open with
Ctrl+E        | Edit              | No             |
Shift+Ctrl+E  | EditNew           | No             |
              | EditComment       | No             | Not used and therefore unmapped.

#### Immutable
Shortcut         | Function                | Left hand only                | Comment
-------------    | -------------           | -------------                 | -------------
/                | QuickSearch             | Yes (maybe copy paste search) | Not used. Configured DC so that every letter typed will open the quick filter.
Ctrl+S           | Search                  | Yes                           |
Shift+Ctrl+M     | CountDirContent         | Yes                           | Calculate size for directories and show it instead of \<DIR\>
Shift+Ctrl+Space | CalculateSpace          | Nice to have                  |
Ctrl+.           | ShowSysFiles            | Nice to have                  |
Shift+Ctrl+S     | RunTerm                 | Not really                    | Like Ctrl+Super+s but with the current directory of DC.
Ctrl+L           | FocusCmdLine            | Not really                    | Was mapped to Shift+F2 but Ctrl+L is more convenient because it has a similar meaning in Firefox. Overwrites default CalculateSpace in DC.
Shift+Alt+J      | MarkCurrentExtension    | Nice to have                  |
Shift+Alt+K      | UnmarkCurrentExtension  | Nice to have                  |
\-               | MarkMinus               | Nice to have                  |
Ctrl+B           | MarkPlus                | No                            |
Shift+Alt+X      | CopyNamesToClip         | Nice to have                  | Shift+Ctrl+X is already used by Qubes OS.
Shift+Alt+C      | CopyPathToClipboard.lua | Nice to have                  | Copy full path of selected file. Shift+Ctrl+C is already used by Qubes OS.
Ctrl+Z           | CopyPathToClipboard.lua | Nice to have                  | Copy path of current panel to clipboard.
Ctrl+1           | SortByName              | Nice to have                  |
Ctrl+2           | SortByExt               | Nice to have                  |
Ctrl+3           | SortBySize              | Nice to have                  |
Ctrl+4           | SortByDate              | Nice to have                  |
Ctrl+5           | SortByAttr              | Nice to have                  |
Ctrl+6           | SortByRunCount          | Nice to have                  | DC currently does not have it but other file explorers/finders might.
Shift+Ctrl+H     | QuickView               | Nice to have                  |
Shift+Ctrl+J     | ColumnsView             | Nice to have                  |
Shift+Ctrl+K     | BriefView               | Nice to have                  |
Shift+Ctrl+L     | ThumbnailsView          | Nice to have                  |
Shift+Ctrl+1     | PanelsSplitterPerPos    | Nice to have                  | splitpct=50
Shift+Ctrl+2     | PanelsSplitterPerPos    | Nice to have                  | splitpct=60
Shift+Ctrl+3     | PanelsSplitterPerPos    | Nice to have                  | splitpct=70
Shift+Ctrl+4     | PanelsSplitterPerPos    | Nice to have                  | splitpct=80
Shift+Ctrl+5     | PanelsSplitterPerPos    | Nice to have                  | splitpct=90
Shift+Ctrl+6     | PanelsSplitterPerPos    | Nice to have                  | splitpct=100
Shift+Ctrl+9     | PanelsSplitterPerPos    | Nice to have                  | Auto fit. DC currently does not have it but other file explorers/finders might.
Shift+Ctrl+7     | HorizontalFilePanels    | Nice to have                  |
Shift+Ctrl+I     | DirHotList              | Not really                    |
Ctrl+H           | DirHistory              | Not really                    |
Shift+Ctrl+N     | ShowCmdLineHistory      | Not really                    |
Ctrl+Ö           | OpenDirInNewTab         | Nice to have                  |
Ctrl+N           | NewTab                  | Nice to have                  |
Ctrl+U           | Exchange                | Nice to have                  |
Alt+Z            | TargetEqualSource       | Nice to have                  |
Shift+Alt+H      | LeftOpenDrives          | Nice to have                  |
Shift+Alt+N      | RightOpenDrives         | Nice to have                  |
Ctrl+,           | ChangeDirToHome         | Nice to have                  |
Ctrl+/           | ChangeDirToRoot         | Nice to have                  | Not working on Windows with neo-vars by default. Workaround provided in `../install.ps1`.
Shift+Alt+S      | SyncDirs                | Yes                           |
Shift+Alt+M      | ConfigHotKeys           | Not really                    | Helps for quick shortcut lookup.

#### Used keys

* Ctrl + [,.1ABCDEFGHIJKLMNOPQRSUVWXYÄ]
* Shift+Ctrl + [ACDEHIJKLMNOSUVX]

#### Free shortcuts

* *+[ÖÄÜ] (Ö is particularly interesting because it is directly under the pinky)
* Ctrl+[TG]
* Shift+Ctrl+[BFPQWYZ]
* Shift+Alt+
* Shift+Tab
* Shift+Alt+Enter (double)
* Shift+Ctrl+U  (Enter Unicode hex value does not work currently anyway)
* Shift+Ctrl+I
* Shift+Ctrl+B

#### Does not work

* Non-ASCII characters (except ÖÄÜ)

### LibreOffice

#### LibreOffice

Shortcut      | Function                     | Left hand only | Comment
------------- | -------------                | -------------  | -------------
Shift+Ctrl+X  | Numbering → Bullets On/Off   | Yes            |
Shift+Ctrl+C  | Numbering → Numbering On/Off | Yes            |

#### LibreOffice Calc

Shortcut      | Function                              | Left hand only | Comment
------------- | -------------                         | -------------  | -------------
Shift+Ctrl+X  | Format → Optimal Column Width, direct | Yes            |
Shift+Ctrl+D  | Edit → Delete Rows                    | Yes            |

#### LibreOffice Impress

Shortcut      | Function                       | Left hand only | Comment
------------- | -------------                  | -------------  | -------------
Ctrl+D        | View → Start from current page | Yes            |
Shift+Ctrl+C  | Options → Slide Show Settings  | Yes            |

### Evince

#### Default

Cheat Cheat of the great default shortcuts.

Shortcut      | Function                                                 | Left hand only | Comment
------------- | -------------                                            | -------------  | -------------
P             | Go to previous page                                      | Nice to have   |
N             | Go to next page                                          | Nice to have   |
J             | Go to line down                                          | Nice to have   |
K             | Go to line up                                            | Nice to have   |
Ctrl+N        | Start a new instance of Evince with the current document | Nice to have   |

### SikuliX

#### Default

Shortcut      | Function            | Left hand only | Comment
------------- | -------------       | -------------  | -------------
Shift+Alt+C   | Abort SikulX script | Nice to have   | As long as SikuliX 1.1.1 is open, it always intercepts this key combination.

## Terminal programs

### Tmux

See [.tmux.conf][] …

### Vim

See [.vimrc][] (Folds *Key (re)Mappings* and *Bundles and plugins*) …

Use Neo2 bindings where possible. Don‘t use `$`, use Mod4+G.

* Use one key with modifiers for actions which might be used repeatable or
  toggle something like | in normal mode which toggles comments for the line or ❤ (Shift+Layer3Mod+W) which closes one window or split.

#### Free shortcuts

Normal mode:

* Umlauts
* Shift+Space

<!-- links -->

[VimFx]: https://github.com/akhodakivskiy/VimFx
[cVim]: https://github.com/1995eaton/chromium-vim
[special-keys]: #special-keys
[Double Commander]: #double-commander-dc
[.vimrc]: /vimrc
[.tmux.conf]: /tmux.conf
[suspend-script]: https://github.com/ypid/scripts/blob/master/suspend-via-gnome
[autokey]: https://code.google.com/p/autokey/
[Steps Ahead]: https://de.wikipedia.org/wiki/Steps_Ahead
[freerdp]: https://github.com/FreeRDP/FreeRDP
[Neo2]: http://www.neo-layout.org/

## Miscellaneous

For M$ Windows see [custom.ahk](/windows/neo-vars/source/custom.ahk).
