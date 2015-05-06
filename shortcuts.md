# Shortcuts

Here are some common shortcuts that I use and which I configure in every program which makes sense and allows to do so.

The use of the shift modifier key is explicitly written down. Modifier keys are written down from left to right e.g. shift+ctrl+super+alt.

Left hand only: Should be easy to use with the left hand, because it is often used during work with the mouse. For example switching windows or Ctrl+C to copy to the clipboard.

## Advises: Shortcuts done right

Here are some advices regarding shortcuts for programmers or UI designers which I would like to see implemented:

* Allow more than one shortcut for one action!
* Allow to reconfigure *everything*.
* Make it easy to track the configuration files (which contain the shortcuts) with version control. This also means not to store the shortcuts together with things that you don‘t want to track (like recent files or usernames and passwords).
* The user types something in an input view then certain shortcuts are expected to work:
  * Ctrl+A: Select all
  * Shift+Ctrl+A: Select none
  * Ctrl+Z: Undo
  * Shift+Ctrl+Y: Undo (Maybe worth a thought because it is way easier to reach then Ctrl+z)
  * Ctrl+Y: Redo
  * Ctrl+U: Delete line
  * Ctrl+W: Delete word
  * Ctrl+H: Delete character

* Do not reinvent the wheel!

## Shortcut “Namespaces”

Which shortcuts should be used where? – Some thoughts …

* Shift+Alt: Shared between window manager and applications.
* Ctrl+Alt: Dedicated to window manager respectively shortcuts which can be triggered globally.
  * Music player uses Ctrl+Alt except for Shift+Alt+X because of left hand use.
* Shift+Super: Dedicated for AutoKey
    * Can also be used over RDP on Windows machines without interfering with MS Windows mappings of the Super key.

### Free

* Super (WinKey): Almost forgotten :)

### Avoid

* Remapping Alt+Letter

### No goes

* Never map Alt+Letter where letter is a character which is located on the left of a QWERTZ keyboard.

## Shortcut key order

To search for shortcuts, it is important to maintain a unique naming pattern. The following is which I use in this document. It is pretty much based on the order of [Double Commander]:

* Ctrl
* Shift
* Super
* Alt
* `Non modifier keys` (letter, written in upper case for readability)

## Free shortcuts
List of free shortcuts (they may have a default mapping but there are better shortcuts for those actions so that the shortcuts are available to be mapped to a different action).

## Special keys
Key name      | Comment
------------- | -------------
Level5 Shift  | This key is in my configuration the <> button.
+             | Separator for keys
anything else | is either a usual key name or a regular expression to specify a range of keys

## Window manager (Gnome3)

Own shortcuts for the window manager should include the Super key which is normally not used by applications.

### GTK+

Shortcut      | Function                | Left hand only | Comment
------------- | -------------           | -------------  | -------------
Shift+Ctrl+U  | Enter Unicode hex value | No             |

### Navigation

Shortcut                              | Function                                  | Left hand only | Comment
-------------                         | -------------                             | -------------  | -------------
Shift+Alt+A                           | Move window one workspace to the left     | Yes            | Currently not used, just defined to be consistent.
Shift+Alt+D                           | Move window one workspace to the right    | Yes            | Currently not used, just defined to be consistent.
Shift+Alt+W                           | Move window one workspace up              | Yes            |
Shift+Alt+S                           | Move window one workspace down            | Yes            |
Alt+[Level5 Shift][special-keys]      | Switch windows                            | Of course      | Easier to reach than Alt-Tab
Super+J                               | Switch to next windows                    | No             | See [shellshape][].
Super+K                               | Switch to previous windows                | No             | See [shellshape][].
Super+D                               | switch workspace to vertical tiled mode   | Yes            | See [shellshape][].
Super+F                               | switch workspace to floating mode         | Yes            | See [shellshape][].
Super+G                               | switch workspace to horizontal tiled mode | Yes            | See [shellshape][].
Shift+Super+J                         | swap with next window                     | No             | See [shellshape][].
Shift+Super+K                         | swap with previous window                 | No             | See [shellshape][].
Super+M                               | minimize window                           | No             | See [shellshape][].
Shift+Super+M                         | un-minimize last window                   | No             | See [shellshape][].
Super+H                               | shrink master area                        | No             | See [shellshape][].
Super+L                               | grow master area                          | No             | See [shellshape][].
Super+U                               | shrink a slave area                       | No             | See [shellshape][].
Super+I                               | grow a slave area                         | No             | See [shellshape][].
Shift+Super+H                         | decrease window's width                   | No             | See [shellshape][].
Shift+Super+L                         | increase window's width                   | No             | See [shellshape][].
Shift+Super+U                         | decrease window's height                  | No             | See [shellshape][].
Shift+Super+I                         | increase window's height                  | No             | See [shellshape][].
Super+Z                               | toggle window maximized state             | No             | See [shellshape][].
Alt+Super+J                           | go to workspace below                     | No             | See [shellshape][].
Alt+Super+K                           | go to workspace above                     | No             | See [shellshape][].
Shift+Alt+Super+J                     | move window to workspace below            | No             | See [shellshape][].
Shift+Alt+Super+K                     | move window to workspace above            | No             | See [shellshape][]. Could release Alt+[WASD]?
Super+A                               | bring window to front / send to back      | No             | See [shellshape][].
Shift+Super+C                         | close window                              | No             | See [shellshape][]. Does not work. Not using it.
Ctrl+Alt+Y                            | Switch to workspace 1                     | Of course      |
Ctrl+Alt+[Level5 Shift][special-keys] | Switch to workspace 2                     | Of course      |

[shellshape]: https://extensions.gnome.org/extension/294/shellshape/

### Sound and Media

Shortcut                                | Function      | Left hand only | Comment
-------------                           | ------------- | -------------  | -------------
Ctrl+Super+[Level5 Shift][special-keys] | Volume down   | Yes            | Maybe other shortcut?
Ctrl+Super+Y                            | Volume up     | Yes            | Maybe other shortcut?

### System

Shortcut        | Function      | Left hand only | Comment
-------------   | ------------- | -------------  | -------------
Ctrl+Super+A    | Lock screen   | Yes            |
Ctrl+Alt+Delete | Log out       | No             | Not really used yet

### Typing

Shortcut      | Function                                            | Left hand only | Comment
------------- | -------------                                       | -------------  | -------------
Alt+Super+C   | Switch to next input source (e.g. qNeo2 and qwertz) | Yes            |

### Windows

Shortcut      | Function                        | Left hand only | Comment
------------- | -------------                   | -------------  | -------------
Ctrl+Q        | Close window                    | Yes            | If Ctrl-q does not work, defined in gnome-terminal by default
Ctrl+Alt+F    | Toggle fullscreen mode          | Yes            | If Alt-f does not work. Try to use Ctrl+Alt+f because it is more generic. Use Shift+Super+f to emit F11.
Ctrl+Alt+W    | Maximize window                 | Yes            |
Ctrl+Alt+S    | Restore previous size of window | Yes            |
Ctrl+Alt+A    | View split on left              | Yes            |
Ctrl+Alt+D    | View split on right             | Yes            |

### Custom shortcuts

Shortcut         | Function                                   | Left hand only | Comment
-------------    | -------------                              | -------------  | -------------
Ctrl+Super+S     | Launch program `x-terminal-emulator`       | Yes            |
Ctrl+Super+[1-9] | Launch custom program or script            | Yes and no     |
Shift+Ctrl+Alt+O | Launch program `eject`                     | No             | eject removable media
Ctrl+Alt+C       | Launch [script][suspend-script] to suspend | Yes            |
Ctrl+Alt+V       | `poweroff`                                 | Yes            |

## GUI applications

### Clementine

Configured in clementine, but they apply globally.

Shortcut      | Function                      | Left hand only | Comment
------------- | -------------                 | -------------  | -------------
Ctrl+Alt+X    | `clementine --play-pause`     | Of course      | Play or pause audio. Using command line to also allow to start the program if no instance is running.
Shift+Alt+X   | `clementine --next`           | Of course      | Play next audio file
Ctrl+Alt+N    | Seek backward                 | Nice to have   | Seek in audio file by *n* seconds.
Ctrl+ALt+M    | Seek forward                  | Nice to have   | Seek in audio file by *n* seconds.
Ctrl+Alt+Z    | Rate the current song 1 star  | No             | I would prefer ¹ (entered with Mod3+1) but I did not find a way. Edit: ¹ not in global mode, so Ctrl+Alt+z is ok :)
Ctrl+Alt+U    | Rate the current song 2 stars | No             |
Ctrl+Alt+I    | Rate the current song 3 stars | No             |
Ctrl+Alt+O    | Rate the current song 4 stars | No             |
Ctrl+Alt+P    | Rate the current song 5 stars | No             |

### Windows and tabs

Applies for: firefox, gnome-terminal, Double Commander (not fully yet because some are not configurable)

For gnome-terminal, each shortcut requires additionally the use of the Shift modifier key.

Shortcut      | Function                                | Left hand only | Comment
------------- | -------------                           | -------------  | -------------
Ctrl+N        | Opens a new tab                         | No             | Easier to reach than C-t
Ctrl+tab      | Switch to right tab, cicle through tabs | Yes            |
Ctrl+J        | Switch to left tab                      | Not really     |
Ctrl+K        | Switch to right tab                     | Not really     |
Ctrl+[+-]     | Increase/Decrease (zoom) font size      | Nice to have   | Level 3 [Neo2][] plus and minus do not work in firefox (works nicely because the plus „p“ and the minus „ü“ are next to each other). Using Level 4 once (which currently don’t work with gnome-terminal. Using Level 4 plus and Level 1 hyphen for this.).
Ctrl+W        | Closes the tab                          | Of course      | Should be default in all program
Ctrl+Q        | Closes the application                  | Of course      | Should be default in all program

### Autokey

Here are the shortcuts I use to trigger [autokey][] actions.

#### Emitting keystrokes

The keystrokes are intended for the application and not to be trapped by the window manager.

##### Global

Shortcut      | Function        | Left hand only | Comment
------------- | -------------   | -------------  | -------------
Shift+Super+V | enter           | Yes            | Emit enter. If AltGr+v does not work (unfortunately AltGr can currently not be used in autokey).
Shift+Super+m |                 | Yes            | Emits F1. Neo2 numbers.
Shift+Super+, |                 | Yes            | Emits F2. Neo2 numbers.
Shift+Super+. |                 | Yes            | Emits F3. Neo2 numbers.
Shift+Super+j |                 | Yes            | Emits F4. Neo2 numbers.
Shift+Super+R | Reload          | Yes            | Emits F5. Most applications will either reload or go to presentation mode.
Shift+Super+l |                 | Yes            | Emits F6. Neo2 numbers.
Shift+Super+u |                 | Yes            | Emits F7. Neo2 numbers.
Shift+Super+i |                 | Yes            | Emits F8. Neo2 numbers.
Shift+Super+o |                 | Yes            | Emits F9. Neo2 numbers.
Shift+Super+F | F11             | Yes            | Emits F11. Causes most applications to go in full screen.
Alt+M         | Switch to tab 1 | No             | See [Neo2 layer4][Neo2]. Maybe blocks the use of Alt+[a-z]. I hope that most applications use letters which would be on the left side of a qwertz keyboard.
Alt+,         | Switch to tab 2 | No             |
Alt+.         | Switch to tab 3 | No             |
Alt+J         | Switch to tab 4 | No             |
Alt+K         | Switch to tab 5 | No             |
Alt+L         | Switch to tab 6 | No             |
Alt+U         | Switch to tab 7 | No             |
Alt+I         | Switch to tab 8 | No             |
Alt+O         | Switch to tab 9 | No             |

##### Application specific

###### Pidgin

Shortcut      | Function                          | Left hand only | Comment
------------- | -------------                     | -------------  | -------------
Ctrl+H        | Change spell check language to de | No             | See [script](/autokey/Emitting keystrokes/Pidgin/Change language in Pidgin to de.py)
Ctrl+L        | Change spell check language to en | No             | See [script](/autokey/Emitting keystrokes/Pidgin/Change language in Pidgin to en.py)

###### ERP system Steps Ahead

This section describes some mapping which I added to make working with the ERP system [Steps Ahead][] more pleasant. I am relaying on an ugly hack to achieve this because [Steps Ahead][] (even in the current version 9.5.3) does not allow to remap or add shortcuts to actions which already have a default shortcut … So I use [autokey][] to do this anyway. It works the following: When autokey intercepts one of the following shortcuts it emits the shortcut on which Steps Ahead triggers the desired action.

Shortcut      | Function                          | Left hand only | Comment
------------- | -------------                     | -------------  | -------------
Shift+Super+S | Clone dataset (copy and paste it) | Yes            | Emits Shift+F6 followed by enter (to acknowledge the „Do you really want to copy …“ dialog).

### Firefox

I use [VimFx][] to get all the Vim basics …

To customize firefox even further I use [Customizable Shortcuts](https://addons.mozilla.org/de/firefox/addon/customizable-shortcuts/) and [keyconfig](http://kb.mozillazine.org/Keyconfig_extension).


Shortcut      | Function                            | Left hand only | Comment
------------- | -------------                       | -------------  | -------------
Ctrl+U        | No action                           | No             | Disabled default "View page source" because I hit Ctrl+u multiple times in the location bar to delete the line.
Shift+Ctrl+S  | View page source                    | Yes            |
S             | Toggle bookmarks toolbar on and off | Yes            | With keyconfig: `var toolbar = document.getElementById("PersonalToolbar");toolbar.collapsed = !toolbar.collapsed;document.persist(toolbar.id, "collapsed");`
Shift+Ctrl+D  | Web console (d for Debug)           | Yes            |

### Gimp

Shortcut      | Function      | Left hand only | Comment
------------- | ------------- | -------------  | -------------
W             | tools-move    | Yes            |
Shift+Alt+C   | layers-new    | Yes            |
Ctrl+Y        | Undo          | Yes            | Just easier to reach
Shift+Ctrl+Y  | Redo          | Yes            | Just easier to reach

### Double Commander (DC)

See the manual for the default shortcuts. I added my own which I think are more convenient (I left the original onces pretty much untouched). Note that I make have use of Shift + letter mappings. This seems to break the RenameOnly function [currently](http://doublecmd.sourceforge.net/mantisbt/view.php?id=973).

#### Name spaces

* Ctrl + letter: File navigation and more

#### Mutable
Shortcut      | Function       | Left hand only | Comment
------------- | -------------  | -------------  | -------------
Ctrl+M        | Rename         | Yes            |
Ctrl+P        | RenameOnly     | Not really     |
Shift+Ctrl+R  | MultiRename    | Not really     |
Ctrl+Y        | Copy           | No             |
Ctrl+Shift+V  | CopySamePanel  | No             |
Shift+Alt+E   | Symlink        | Yes            |
Alt+Enter     | FileProperties | Yes            |
Super+M       | MakeDir        | Yes            |
Ctrl+O        | ShellExecute   | Yes            | Open
Shirt+Alt+O   | ContextMenu    | Yes            | Open with
Ctrl+E        | Edit           | No             |
Ctrl+Shift+E  | EditNew        | No             |

#### Immutable
Shortcut         | Function               | Left hand only                | Comment
-------------    | -------------          | -------------                 | -------------
/                | Quick search           | Yes (maybe copy paste search) | Not used. Configured DC so that every letter typed will open the quick filter.
Ctrl+F           | QuickFilter            | Not really                    | filter=toggle
Ctrl+S           | Search                 | Yes                           |
Ctrl+Shift+M     | CountDirContent        | Yes                           |
Ctrl+Shift+Space | CalculateSpace         | Nice to have                  |
Ctrl+.           | ShowSysFiles           | Nice to have                  |
Ctrl+Shift+S     | RunTerm                | Not really                    | Like Ctrl+Super+s but with the current directory.
Ctrl+L           | FocusCmdLine           | Not really                    | Was mapped to Shift+F2 but Ctrl+l is more convenient because it works by default in Firefox. Overwrites default CalculateSpace in DC.
Shift+Alt+X      | MarkCurrentExtension   | Nice to have                  |
Shift+Alt+Y      | UnmarkCurrentExtension | Nice to have                  |
-                | MarkMinus              | Nice to have                  |
Ctrl+B           | MarkPlus               | Nice to have                  |
Ctrl+Shift+X     | CopyNamesToClip        | Nice to have                  |
Ctrl+Shift+C     | CopyFullNamesToClip    | Nice to have                  |
Super+J          | SortByName             | Nice to have                  |
Super+K          | SortByExt              | Nice to have                  |
Super+L          | SortBySize             | Nice to have                  |
Super+Ö          | SortByDate             | Nice to have                  |
Super+Ä          | SortByAttr             | Nice to have                  |
Ctrl+Shift+N     | QuickView              | Nice to have                  |
Ctrl+Shift+J     | ColumnsView            | Nice to have                  |
Ctrl+Shift+K     | BriefView              | Nice to have                  |
Ctrl+Shift+L     | ThumbnailsView         | Nice to have                  |
Ctrl+Shift+U     | PanelsSplitterPerPos   | Nice to have                  | splitpct=50
Ctrl+Shift+I     | PanelsSplitterPerPos   | Nice to have                  | splitpct=70
Ctrl+Shift+O     | PanelsSplitterPerPos   | Nice to have                  | splitpct=100
Ctrl+Shift+H     | HorizontalFilePanels   | Nice to have                  |
Shift+F          | DirHotList             | Not really                    |
Ctrl+H           | DirHistory             | Not really                    |
Ctrl+Alt+,       | ShowCmdLineHistory     | Not really                    |
Ctrl+N           | OpenDirInNewTab        | Nice to have                  |
Ctrl+1           | NewTab                 | Nice to have                  |
Ctrl+U           | Exchange               | Nice to have                  |
Alt+Z            | TargetEqualSource      | Nice to have                  |
Super+H          | LeftOpenDrives         | Nice to have                  |
Super+N          | RightOpenDrives        | Nice to have                  |
Ctrl+,           | ChangeDirToHome        | Nice to have                  |
Ctrl+Tab         | ChangeDirToRoot        | Nice to have                  |

#### Assumed to be default
Mappings which are default or which should be default.

Shortcut      | Function       | Left hand only | Comment
------------- | -------------  | -------------  | -------------
Ctrl+A        | MarkMarkAll    | Yes            |
Shift+Ctrl+A  | MarkUnmarkAll  | Yes            | Default behavior from Gimp.
Ctrl+I        | MarkInvert     | Nice to have   | Default behavior from Gimp.
Ctrl+D        | Delete (Trash) | Yes            |
Shift+Ctrl+D  | Delete         | Yes            |

Note: [Double Commander] works quite nicely together with [Neo2][] …

#### Free shortcuts

* Ctrl+Shift+
* Shift+Alt+
* Alt+X
* Ctrl+G
* Ctrl+T
* Ctrl+E
* Shift+Alt+B
* Shift+Tab
* Shift+Alt+Enter (double)
* Ctrl+B (default)
* Ctrl+Z (default)

#### Does not work

* Ctrl+Shift+,

### Libreoffice

#### Libreoffice Calc

Shortcut      | Function                              | Left hand only | Comment
------------- | -------------                         | -------------  | -------------
Shift+Ctrl+X  | Format → Optimal Column Width, direct | Yes            |

### Evince

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
