# Shortcuts

Here are some common shortcuts that I use and which I configure in every program for which it makes sense and allows to do so.

Left hand only: Should be easy to use with the left hand, because it is often used during work with the mouse. For example switching windows or Ctrl+C to copy to the clipboard.

## Advises: Shortcuts done right

Here are some advices regarding shortcuts for programmers and UI designers which I would like to see implemented:

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

* `Shift+Alt`: W, S, X reserved for window manager. Applications can use everything else.
* `Ctrl+Alt` (unused can be used for hypervisor consoles as host key), `Ctrl+Super`, `Super`: Dedicated to window manager respectively shortcuts which can be triggered globally.
  * Never use the `Super` key for applications as this modifier might be reserved in some window managers. (And I don’t want to find out how to patch Windows to remap that).
* `Shift+Super`: Dedicated to AutoKey (global)
    * Can also be used over RDP on Windows machines without interfering with MS Windows mappings of the Super key.

### Applications

* `Shift`: Applications.
* `Shift+Ctrl`: Applications.
* `Shift+Ctrl+Alt`: Applications.
* `Shift+Alt`: With limitations, see above.

### Avoid

* Remapping `Alt+[A-Z]`

### No goes

* Never map `Alt+<letter>` where letter is a character which is located on the left of a QWERTZ keyboard.

## Free shortcuts

List of free shortcuts (they may have a default mapping but there are better shortcuts for those actions so that the shortcuts are available to be mapped to a different action).

* `Super` (WinKey): Almost forgotten :)
* `Super+Alt`: Reserved (No mapping used so far)
* Shift+Alt+A,
  Shift+Alt+D
  Shift+Alt+
  Ctrl+Alt+Y
  Ctrl+Alt+[Level4 Shift][special-keys]
  Ctrl+Alt+E

## Shortcut conventions and key order

To search for shortcuts, it is important to maintain a unique naming pattern. The following is which I use in this document. It is pretty much based on the order used by [Double Commander]:

* `Ctrl`
* `Shift`
* `Super`
* `Alt`
* `Non-modifier keys` (Letter, written in upper case for readability. The use of the shift modifier key is explicitly written down.)

## Special keys
Key name      | Comment
------------- | -------------
Level4 Shift  | This key in my configuration is the <> button.
+             | Separator for keys
anything else | Is either a usual key name or a regular expression to specify a range of keys

## Window manager (e.g. Gnome3 or xfce)

Own shortcuts for the window manager should include the Super key which is normally not used by applications.

### Navigation

Shortcut                           | Function                       | Left hand only | Comment
-------------                      | -------------                  | -------------  | -------------
Shift+Alt+W                        | Move window one workspace up   | Yes            |
Shift+Alt+S                        | Move window one workspace down | Yes            |
Alt+[Level4 Shift][special-keys]   | Switch windows                 | Of course      | Easier to reach than Alt-Tab.
Super+[Level4 Shift][special-keys] | Switch to workspace 1          | Of course      |
Super+Y                            | Switch to workspace 2          | Of course      |
Super+X                            | Switch to workspace 3          | Of course      |
Super+A                            | Switch to workspace 4          | Of course      |
Super+S                            | Switch to workspace 5          | Of course      |
Super+D                            | Switch to workspace 6          | Of course      |
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
Ctrl+Super+[Level4 Shift][special-keys] | Volume down by 5 % | Yes            |
Ctrl+Super+Y                            | Volume up by 5 %   | Yes            |
Ctrl+Super+X                            | Mute               | Yes            |

### System

Shortcut      | Function      | Left hand only | Comment
------------- | ------------- | -------------  | -------------
Ctrl+Super+A  | Lock screen   | Yes            |

### Typing

Shortcut      | Function                                            | Left hand only | Comment
------------- | -------------                                       | -------------  | -------------
Alt+Super+C   | Switch to next input source (e.g. qNeo2 and qwertz) | Yes            |
Shift+Ctrl+U  | Enter Unicode hex value                             | No             |

### Windows

Shortcut      | Function                                      | Left hand only | Comment
------------- | -------------                                 | -------------  | -------------
Super+Q       | Close window                                  | Yes            | If Ctrl-Q does not work. (Example: gnome-terminal)
Ctrl+Alt+F    | Toggle fullscreen mode                        | Yes            | If Alt-F does not work. Try to use Ctrl+Alt+F because it is more generic. Use Shift+Super+F to emit F11.
Ctrl+Alt+W    | Maximize window                               | Yes            |
Ctrl+Alt+S    | Restore previous size of window               | Yes            |
Ctrl+Alt+A    | Tile window on the left, View split on left   | Yes            |
Ctrl+Alt+D    | Tile window on the right, View split on right | Yes            |

## Qubes OS

Shortcut      | Function             | Left hand only | Comment
------------- | -------------        | -------------  | -------------
Shift+Ctrl+C  | Qubes Inter VM copy  | Yes            |
Shift+Ctrl+C  | Qubes Inter VM paste | Yes            |

### Custom shortcuts

Shortcut         | Function                                  | Left hand only | Comment
-------------    | -------------                             | -------------  | -------------
Ctrl+Super+S     | Launch program `x-terminal-emulator`      | Yes            |
Shift+Super+A    | Launch program `gnome-calculator`         | Nice to have   |
Ctrl+Super+[1-9] | Launch custom program or script           | Yes and no     |
Ctrl+Alt+V       | `reboot`                                  | Yes            |
Ctrl+Alt+G       | `poweroff`                                | Yes            |
Super+J          | Launcher application finder               | Nice to have   | Gnome activities or substation for other WMs. Gnome does by default trigger on Super button press which is a nice feature but does not work on other WMs yet?
Super            | Launcher application finder               | Yes            | Only works with Gnome.
Shift+Ctrl+Alt+O | Launch program `eject`                    | No             | eject removable media, FIXME
Ctrl+Alt+Q       | Show [Neo Layout Viewer][NeoLayoutViewer] | Yes            |

[NeoLayoutViewer](https://github.com/YggdrasiI/NeoLayoutViewer.git)

## GUI applications

### Clementine

#### Global

Shortcut      | Function                   | Left hand only | Comment
------------- | -------------              | -------------  | -------------
Ctrl+Alt+X    | `clementine --play-pause`  | Of course      | Play or pause audio. Using command line to also allow to start the program if no instance is running.
Shift+Alt+X   | `clementine --next`        | Of course      | Play next audio file
Ctrl+Alt+H    | `clementine --next`        | Of course      | Play next audio file
Ctrl+Alt+L    | `clementine --previous`    | Of course      | Play previous audio file
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

### Windows and tabs

Applies to: Firefox, GNOME Terminal, Double Commander.

For GNOME Terminal, each shortcut requires additionally the use of the Shift modifier key.

Shortcut       | Function                                | Left hand only | Comment
-------------  | -------------                           | -------------  | -------------
Ctrl+N         | Opens a new tab                         | No             | Easier to reach than C-t
Ctrl+W         | Closes the tab                          | Of course      | Should be default in all program
Ctrl+Q         | Closes the application                  | Of course      | Should be default in all program
Ctrl+Tab       | Switch to right tab, cycle through tabs | Yes            |
Shift+Ctrl+Tab | Switch to left tab, cycle through tabs  | Yes            |
Ctrl+J         | Switch to left tab                      | Not really     |
Ctrl+K         | Switch to right tab                     | Not really     |
Ctrl+[+-]      | Increase/Decrease (zoom) font size      | Nice to have   | Currently not supported in Double Commander. Level 3 [Neo2][] plus and minus work in Firefox (after setting the − via the Add-On Customizable Shortcuts). GNOME Terminal does not allow to configure „−” currently (can this be done in Gtk programs?).

#### Used keys

* Ctrl + [CDJKNQVWX]

### Autokey

Here are the shortcuts I use to trigger [autokey][] actions.

#### Emitting keystrokes

The keystrokes are intended for the application and not to be trapped by the window manager.

##### Global

Shortcut      | Function        | Left hand only | Comment
------------- | -------------   | -------------  | -------------
Shift+Super+V | enter           | Yes            | Emit enter. If AltGr+v does not work (unfortunately AltGr can currently not be used in autokey).
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

<!--

Don’t do it globally via AutoKey. This will mess up Alt+[A-Z] shortcuts …

Just enable it in applications which support this. This has the advantage that the application can behave differently depending on the context it is in thus still allowing to use Alt+[A-Z]

Alt+M         | Switch to tab 1 | No             | See [Neo2 layer4][Neo2]. Maybe blocks the use of Alt+[a-z]. I hope that most applications use letters which would be on the left side of a qwertz keyboard.
Alt+,         | Switch to tab 2 | No             |
Alt+.         | Switch to tab 3 | No             |
Alt+J         | Switch to tab 4 | No             |
Alt+K         | Switch to tab 5 | No             |
Alt+L         | Switch to tab 6 | No             |
Alt+U         | Switch to tab 7 | No             |
Alt+I         | Switch to tab 8 | No             |
Alt+O         | Switch to tab 9 | No             |

-->

##### Application specific

###### Pidgin

Shortcut      | Function                          | Left hand only | Comment
------------- | -------------                     | -------------  | -------------
Ctrl+H        | Change spell check language to de | No             | See [script](/autokey/Emitting keystrokes/Pidgin/Change language in Pidgin to de.py)
Ctrl+L        | Change spell check language to en | No             | See [script](/autokey/Emitting keystrokes/Pidgin/Change language in Pidgin to en.py)

###### ERP system Steps Ahead

This section describes some mapping which I added to make working with the ERP system [Steps Ahead][] more pleasant. I am relaying on an ugly hack to achieve this because [Steps Ahead][] (even in the current version 9.5.3) does not allow to remap or add shortcuts to actions which already have a default shortcut … So I use [autokey][] to do this anyway. It works the following way: When autokey intercepts one of the following shortcuts it emits the shortcut on which Steps Ahead triggers the desired action.

Shortcut      | Function                          | Left hand only | Comment
------------- | -------------                     | -------------  | -------------
Shift+Super+S | Clone dataset (copy and paste it) | Yes            | Emits Shift+F6 followed by enter (to acknowledge the „Do you really want to copy …“ dialog).

### Firefox

I use [VimFx][] to get all the Vim basics …

To customize Firefox even further I use [Customizable Shortcuts](https://github.com/ttaubert/customizable-shortcuts).

Shortcut      | Function                  | Left hand only | Comment
------------- | -------------             | -------------  | -------------
Ctrl+U        | No action                 | No             | Disabled default "View page source" because I hit Ctrl+u multiple times in the location bar to delete the line.
Shift+Ctrl+S  | View page source          | Yes            |
Shift+Ctrl+D  | Web console (d for Debug) | Yes            |
Shift+Ctrl+W  | Undo Close Tab            | Yes            |

### Gimp

Shortcut      | Function      | Left hand only | Comment
------------- | ------------- | -------------  | -------------
W             | tools-move    | Yes            |
Shift+Alt+C   | layers-new    | Yes            |
Ctrl+Y        | Undo          | Yes            | Just easier to reach
Shift+Ctrl+Y  | Redo          | Yes            | Just easier to reach

### VirtualBox and other hypervisors

Shortcut      | Function            | Left hand only | Comment
------------- | -------------       | -------------  | -------------
Ctrl+Alt      | Host key            | Nice to have   |
Host key+M    | Insert Ctrl+Alt+Del | Nice to have   |

### Double Commander (DC)

See the manual for the default shortcuts. I added my own which I think are more convenient.

Note that using `Shift+[A-Z]` currently has side effects when using the RenameOnly function [currently](http://doublecmd.sourceforge.net/mantisbt/view.php?id=973) so I avoid to use `Shift+[A-Z]` for actions.

Hint: [Double Commander] works quite nicely together with [Neo2][] …

* Don’t restrict control to files panel for actions which are shown in the function key buttons area so that DC shows the mapping there too.

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
Ctrl+M        | Rename            | Yes            |
Ctrl+P        | RenameOnly        | Not really     |
Shift+Ctrl+R  | MultiRename       | Not really     |
Ctrl+Y        | Copy              | No             |
Shift+Ctrl+V  | CopySamePanel     | No             |
Shift+Alt+E   | Symlink           | Yes            |
Shift+Alt+C   | FileProperties    | Yes            |
Shift+Alt+F   | SetFileProperties | Nice to have   |
Ctrl+F        | MakeDir           | Not really     |
Ctrl+O        | ShellExecute      | Yes            | Open
Shift+Ctrl+O  | ContextMenu       | Yes            | Open with
Ctrl+E        | Edit              | No             |
Shift+Ctrl+E  | EditNew           | No             |
Ctrl+Z        | EditComment       | No             |

#### Immutable
Shortcut         | Function               | Left hand only                | Comment
-------------    | -------------          | -------------                 | -------------
/                | QuickSearch            | Yes (maybe copy paste search) | Not used. Configured DC so that every letter typed will open the quick filter.
Ctrl+S           | Search                 | Yes                           |
Shift+Ctrl+M     | CountDirContent        | Yes                           | Calculate size for directories and show it instead of \<DIR\>
Shift+Ctrl+Space | CalculateSpace         | Nice to have                  |
Ctrl+.           | ShowSysFiles           | Nice to have                  |
Shift+Ctrl+S     | RunTerm                | Not really                    | Like Ctrl+Super+s but with the current directory of DC.
Ctrl+L           | FocusCmdLine           | Not really                    | Was mapped to Shift+F2 but Ctrl+L is more convenient because it has a similar meaning in Firefox. Overwrites default CalculateSpace in DC.
Shift+Alt+J      | MarkCurrentExtension   | Nice to have                  |
Shift+Alt+K      | UnmarkCurrentExtension | Nice to have                  |
-                | MarkMinus              | Nice to have                  |
Ctrl+B           | MarkPlus               | No                            |
Shift+Ctrl+X     | CopyNamesToClip        | Nice to have                  |
Shift+Ctrl+C     | CopyFullNamesToClip    | Nice to have                  |
Ctrl+1           | SortByName             | Nice to have                  |
Ctrl+2           | SortByExt              | Nice to have                  |
Ctrl+3           | SortBySize             | Nice to have                  |
Ctrl+4           | SortByDate             | Nice to have                  |
Ctrl+5           | SortByAttr             | Nice to have                  |
Shift+Ctrl+H     | QuickView              | Nice to have                  |
Shift+Ctrl+J     | ColumnsView            | Nice to have                  |
Shift+Ctrl+K     | BriefView              | Nice to have                  |
Shift+Ctrl+L     | ThumbnailsView         | Nice to have                  |
Shift+Ctrl+1     | PanelsSplitterPerPos   | Nice to have                  | splitpct=50
Shift+Ctrl+2     | PanelsSplitterPerPos   | Nice to have                  | splitpct=60
Shift+Ctrl+3     | PanelsSplitterPerPos   | Nice to have                  | splitpct=70
Shift+Ctrl+4     | PanelsSplitterPerPos   | Nice to have                  | splitpct=80
Shift+Ctrl+5     | PanelsSplitterPerPos   | Nice to have                  | splitpct=90
Shift+Ctrl+6     | PanelsSplitterPerPos   | Nice to have                  | splitpct=100
Shift+Ctrl+7     | HorizontalFilePanels   | Nice to have                  |
Shift+Ctrl+I     | DirHotList             | Not really                    |
Ctrl+H           | DirHistory             | Not really                    |
Shift+Ctrl+N     | ShowCmdLineHistory     | Not really                    |
Ctrl+N           | OpenDirInNewTab        | Nice to have                  |
Ctrl+G           | NewTab                 | Nice to have                  |
Ctrl+U           | Exchange               | Nice to have                  |
Alt+Z            | TargetEqualSource      | Nice to have                  |
Shift+Alt+H      | LeftOpenDrives         | Nice to have                  |
Shift+Alt+N      | RightOpenDrives        | Nice to have                  |
Ctrl+,           | ChangeDirToHome        | Nice to have                  |
Ctrl+/           | ChangeDirToRoot        | Nice to have                  |
Shift+Alt+S      | SyncDirs               | Yes                           |

#### Used keys

* Ctrl + [,.1ABCDEFHIJKLMNOPQSUVWXY]
* Shift+Ctrl + [ACDEHIJKLMNOSUVX]

#### Free shortcuts

* Ctrl+[GT]
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
[special-keys]: #special-keys
[Double Commander]: #double-commander-dc
[.vimrc]: /.vimrc
[.tmux.conf]: /.tmux.conf
[suspend-script]: https://github.com/ypid/scripts/blob/master/suspend-via-gnome
[autokey]: https://code.google.com/p/autokey/
[Steps Ahead]: https://de.wikipedia.org/wiki/Steps_Ahead
[freerdp]: https://github.com/FreeRDP/FreeRDP
[Neo2]: http://www.neo-layout.org/

## Miscellaneous

For M$ Windows see [autohotkey](/autohotkey).
