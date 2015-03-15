# Shortcuts

Here are some common shortcuts that I use and which I configure in every program which makes sense and allows to do so.

The use of the shift modifier key is explicitly written down. Modifier keys are written down from left to right e.g. shift+ctrl+super+alt.

Left hand only: Should be easy to use with the left hand, because it is often used during work with the mouse. For example switching windows or Ctrl+c to copy to the clipboard.

## Advises: Shortcuts done right

Here are some advices regarding shortcuts for programmers or UI designers which I would like to see implemented:

* Allow more than one shortcut for one action!
* Allow to reconfigure *everything*.
* Make it easy to track the configuration files (which contain the shortcuts) with version control. This also means not to store the shortcuts together with things that you don‘t want to track (like recent files or usernames and passwords).
* The user types something in an input view then certain shortcuts are expected to work:
  * Ctrl+a: Select all
  * Shift+Ctrl+a: Select none
  * Ctrl+z: Undo
  * Shift+Ctrl+y: Undo (Maybe worth a thought because it is way easier to reach then Ctrl+z)
  * Ctrl+y: Redo
  * Ctrl+u: Delete line
  * Ctrl+w: Delete word
  * Ctrl+h: Delete character

* Do not reinvent the wheel!

## Shortcut “Namespaces”

Which shortcuts should be used where? – Some thoughts …

* Shift+Alt: Shared between window manager and applications.
* Ctrl+Alt: Dedicated to window manager respectively shortcuts which can be triggered globally.
  * Music player uses Ctrl+Alt except for Shift+Alt+x because of left hand use.
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
Shift+Ctrl+u  | Enter Unicode hex value | No             |

### Navigation

Shortcut                              | Function                                  | Left hand only | Comment
-------------                         | -------------                             | -------------  | -------------
Shift+Alt+A                           | Move window one workspace to the left     | Yes            | Currently not used, just defined to be consistent.
Shift+Alt+D                           | Move window one workspace to the right    | Yes            | Currently not used, just defined to be consistent.
Shift+Alt+W                           | Move window one workspace up              | Yes            |
Shift+Alt+S                           | Move window one workspace down            | Yes            |
Alt+[Level5 Shift][special-keys]      | Switch windows                            | Of course      | Easier to reach than Alt-Tab
Super+j                               | Switch to next windows                    | No             | See [shellshape][].
Super+k                               | Switch to previous windows                | No             | See [shellshape][].
Super+d                               | switch workspace to vertical tiled mode   | Yes            | See [shellshape][].
Super+f                               | switch workspace to floating mode         | Yes            | See [shellshape][].
Super+g                               | switch workspace to horizontal tiled mode | Yes            | See [shellshape][].
Shift+Super+j                         | swap with next window                     | No             | See [shellshape][].
Shift+Super+k                         | swap with previous window                 | No             | See [shellshape][].
Super+m                               | minimize window                           | No             | See [shellshape][].
Shift+Super+m                         | un-minimize last window                   | No             | See [shellshape][].
Super+h                               | shrink master area                        | No             | See [shellshape][].
Super+l                               | grow master area                          | No             | See [shellshape][].
Super+u                               | shrink a slave area                       | No             | See [shellshape][].
Super+i                               | grow a slave area                         | No             | See [shellshape][].
Shift+Super+h                         | decrease window's width                   | No             | See [shellshape][].
Shift+Super+l                         | increase window's width                   | No             | See [shellshape][].
Shift+Super+u                         | decrease window's height                  | No             | See [shellshape][].
Shift+Super+i                         | increase window's height                  | No             | See [shellshape][].
Super+z                               | toggle window maximized state             | No             | See [shellshape][].
Alt+Super+j                           | go to workspace below                     | No             | See [shellshape][].
Alt+Super+k                           | go to workspace above                     | No             | See [shellshape][].
Shift+Alt+Super+j                     | move window to workspace below            | No             | See [shellshape][].
Shift+Alt+Super+k                     | move window to workspace above            | No             | See [shellshape][]. Could release Alt+[WASD]?
Super+a                               | bring window to front / send to back      | No             | See [shellshape][].
Shift+Super+c                         | close window                              | No             | See [shellshape][]. Does not work. Not using it.
Ctrl+Alt+y                            | Switch to workspace 1                     | Of course      |
Ctrl+Alt+[Level5 Shift][special-keys] | Switch to workspace 2                     | Of course      |

[shellshape]: https://extensions.gnome.org/extension/294/shellshape/

### Sound and Media

Shortcut                                | Function      | Left hand only | Comment
-------------                           | ------------- | -------------  | -------------
Ctrl+Super+[Level5 Shift][special-keys] | Volume down   | Yes            | Maybe other shortcut?
Ctrl+Super+y                            | Volume up     | Yes            | Maybe other shortcut?

### System

Shortcut        | Function      | Left hand only | Comment
-------------   | ------------- | -------------  | -------------
Ctrl+Super+a    | Lock screen   | Yes            |
Ctrl+Alt+Delete | Log out       | No             | Not really used yet

### Typing

Shortcut      | Function                                            | Left hand only | Comment
------------- | -------------                                       | -------------  | -------------
Alt+Super+c   | Switch to next input source (e.g. qNeo2 and qwertz) | Yes            |

### Windows

Shortcut      | Function                        | Left hand only | Comment
------------- | -------------                   | -------------  | -------------
Ctrl+Q        | Close window                    | Yes            | If Ctrl-q does not work, defined in gnome-terminal by default
Ctrl+Alt+f    | Toggle fullscreen mode          | Yes            | If Alt-f does not work. Try to use Ctrl+Alt+f because it is more generic. Use Shift+Super+f to emit F11.
Ctrl+Alt+w    | Maximize window                 | Yes            |
Ctrl+Alt+s    | Restore previous size of window | Yes            |
Ctrl+Alt+a    | View split on left              | Yes            |
Ctrl+Alt+d    | View split on right             | Yes            |

### Custom shortcuts

Shortcut         | Function                                   | Left hand only | Comment
-------------    | -------------                              | -------------  | -------------
Ctrl+Super+s     | Launch program `x-terminal-emulator`       | Yes            |
Ctrl+Super+[1-9] | Launch custom program or script            | Yes and no     |
Shift+Ctrl+Alt+o | Launch program `eject`                     | No             | eject removable media
Ctrl+Alt+c       | Launch [script][suspend-script] to suspend | Yes            |
Ctrl+Alt+v       | `poweroff`                                 | Yes            |

## GUI applications

### Clementine

Configured in clementine, but they apply globally.

Shortcut      | Function                      | Left hand only | Comment
------------- | -------------                 | -------------  | -------------
Ctrl+Alt+x    | `clementine --play-pause`     | Of course      | Play or pause audio. Using command line to also allow to start the program if no instance is running.
Shift+Alt+x   | `clementine --next`           | Of course      | Play next audio file
Ctrl+Alt+n    | Seek backward                 | Nice to have   | Seek in audio file by *n* seconds.
Ctrl+ALt+m    | Seek forward                  | Nice to have   | Seek in audio file by *n* seconds.
Ctrl+Alt+z    | Rate the current song 1 star  | No             | I would prefer ¹ (entered with Mod3+1) but I did not find a way. Edit: ¹ not in global mode, so Ctrl+Alt+z is ok :)
Ctrl+Alt+u    | Rate the current song 2 stars | No             |
Ctrl+Alt+i    | Rate the current song 3 stars | No             |
Ctrl+Alt+o    | Rate the current song 4 stars | No             |
Ctrl+Alt+p    | Rate the current song 5 stars | No             |

### Windows and tabs

Applies for: firefox, gnome-terminal, Double Commander (not fully yet because some are not configurable)

For gnome-terminal, each shortcut requires additionally the use of the Shift modifier key.

Shortcut      | Function                                | Left hand only | Comment
------------- | -------------                           | -------------  | -------------
Ctrl+n        | Opens a new tab                         | No             | Easier to reach than C-t
Ctrl+tab      | Switch to right tab, cicle through tabs | Yes            |
Ctrl+j        | Switch to left tab                      | Not really     |
Ctrl+k        | Switch to right tab                     | Not really     |
Ctrl+[+-]     | Increase/Decrease (zoom) font size      | Nice to have   | Level 3 [Neo2][] plus and minus do not work in firefox (works nicely because the plus „p“ and the minus „ü“ are next to each other). Using Level 4 once (which currently don’t work with gnome-terminal. Using Level 4 plus and Level 1 hyphen for this.).
Ctrl+w        | Closes the tab                          | Of course      | Should be default in all program
Ctrl+q        | Closes the application                  | Of course      | Should be default in all program

### Autokey

Here are the shortcuts I use to trigger [autokey][] actions.

#### Emitting keystrokes

The keystrokes are intended for the application and not to be trapped by the window manager.

##### Global

Shortcut      | Function        | Left hand only | Comment
------------- | -------------   | -------------  | -------------
Shift+Super+v | enter           | Yes            | Emit enter. If AltGr+v does not work (unfortunately AltGr can currently not be used in autokey).
Shift+Super+f | F11             | Yes            | Emit F11. Causes most applications to go in full screen.
Shift+Super+r | Reload          | Yes            | Emits F5. Most applications will either reload or go to presentation mode.
Alt+m         | Switch to tab 1 | No             | See [Neo2 layer4][Neo2]. Maybe blocks the use of Alt+[a-z]. I hope that most applications use letters which would be on the left side of a qwertz keyboard.
Alt+,         | Switch to tab 2 | No             |
Alt+.         | Switch to tab 3 | No             |
Alt+j         | Switch to tab 4 | No             |
Alt+k         | Switch to tab 5 | No             |
Alt+l         | Switch to tab 6 | No             |
Alt+u         | Switch to tab 7 | No             |
Alt+i         | Switch to tab 8 | No             |
Alt+o         | Switch to tab 9 | No             |

##### Application specific

###### Pidgin

Shortcut      | Function                          | Left hand only | Comment
------------- | -------------                     | -------------  | -------------
Ctrl+h        | Change spell check language to de | No             | See [script](/autokey/Emitting keystrokes/Pidgin/Change language in Pidgin to de.py)
Ctrl+l        | Change spell check language to en | No             | See [script](/autokey/Emitting keystrokes/Pidgin/Change language in Pidgin to en.py)

###### ERP system Steps Ahead

This section describes some mapping which I added to make working with the ERP system [Steps Ahead][] more pleasant. I am relaying on an ugly hack to achieve this because [Steps Ahead][] (even in the current version 9.5.3) does not allow to remap or add shortcuts to actions which already have a default shortcut … So I use [autokey][] to do this anyway. It works the following: When autokey intercepts one of the following shortcuts it emits the shortcut on which Steps Ahead triggers the desired action.

Shortcut      | Function                          | Left hand only | Comment
------------- | -------------                     | -------------  | -------------
Shift+Super+s | Clone dataset (copy and paste it) | Yes            | Emits Shift+F6 followed by enter (to acknowledge the „Do you really want to copy …“ dialog).

### Firefox

I use [VimFx][] to get all the Vim basics …

To customize firefox even further I use [Customizable Shortcuts](https://addons.mozilla.org/de/firefox/addon/customizable-shortcuts/) and [keyconfig](http://kb.mozillazine.org/Keyconfig_extension).


Shortcut      | Function                            | Left hand only | Comment
------------- | -------------                       | -------------  | -------------
Ctrl+u        | No action                           | No             | Disabled default "View page source" because I hit Ctrl+u multiple times in the location bar to delete the line.
Shift+Ctrl+s  | View page source                    | Yes            |
S             | Toggle bookmarks toolbar on and off | Yes            | With keyconfig: `var toolbar = document.getElementById("PersonalToolbar");toolbar.collapsed = !toolbar.collapsed;document.persist(toolbar.id, "collapsed");`
Shift+Ctrl+d  | Web console (d for Debug)           | Yes            |

### Gimp

Shortcut      | Function      | Left hand only | Comment
------------- | ------------- | -------------  | -------------
W             | tools-move    | Yes            |
Shift+Alt+c   | layers-new    | Yes            |
Ctrl+y        | Undo          | Yes            | Just easier to reach
Shift+Ctrl+y  | Redo          | Yes            | Just easier to reach

### Double Commander (DC)

See the manual for the default shortcuts. I added my own which I think are more convenient (I left the original onces pretty much untouched). Note that I make have use of Shift + letter mappings. This seems to break the RenameOnly function [currently](http://doublecmd.sourceforge.net/mantisbt/view.php?id=973).

#### Name spaces

* Ctrl + letter: File navigation and more

#### Mutable
Shortcut      | Function       | Left hand only | Comment
------------- | -------------  | -------------  | -------------
Super+m       | Rename         | Yes            |
Ctrl+p        | RenameOnly     | Not really     |
Shift+Ctrl+r  | MultiRename    | Not really     |
Ctrl+Y        | Copy           | No             |
Ctrl+Shift+V  | CopySamePanel  | No             |
Shift+Alt+E   | Symlink        | Yes            |
Alt+Enter     | FileProperties | Yes            |
Ctrl+M        | MakeDir        | Yes            |
Ctrl+o        | ShellExecute   | Yes            | Open
Shirt+Alt+o   | ContextMenu    | Yes            | Open with
Ctrl+E        | Edit           | No             |
Ctrl+Shift+E  | EditNew        | No             |

#### Immutable
Shortcut      | Function               | Left hand only                | Comment
------------- | -------------          | -------------                 | -------------
/             | Quick search           | Yes (maybe copy paste search) | Not used. Configured DC so that every letter typed will open the quick filter.
Ctrl+f        | QuickFilter            | Not really                    | filter=toggle
Ctrl+s        | Search                 | Yes                           |
Shift+Ctrl+m  | CountDirContent        | Yes                           |
Shift+Ctrl+U
Ctrl+.        | ShowSysFiles           | Nice to have                  |
Shift+Ctrl+s  | RunTerm                | Not really                    | Like Ctrl+Super+s but with the current directory.
Ctrl+l        | FocusCmdLine           | Not really                    | Was mapped to Shift+F2 but Ctrl+l is more convenient because it works by default in firefox. Overwrites CalculateSpace in DC.
Shift+Alt+x   | MarkCurrentExtension   | Nice to have                  |
Shift+Alt+y   | UnmarkCurrentExtension | Nice to have                  |
-             | MarkMinus              | Nice to have                  |
Ctrl+B        | MarkPlus               | Nice to have                  |
Ctrl+Shift+x  | CopyNamesToClip        | Nice to have                  |
Ctrl+Shift+c  | CopyFullNamesToClip    | Nice to have                  |
Super+J       | SortByName             | Nice to have                  |
Super+K       | SortByExt              | Nice to have                  |
Super+L       | SortBySize             | Nice to have                  |
Super+Ö       | SortByDate             | Nice to have                  |
Super+Ä       | SortByAttr             | Nice to have                  |
Ctrl+Shift+N  | QuickView              | Nice to have                  |
Ctrl+Shift+J  | ColumnsView            | Nice to have                  |
Ctrl+Shift+K  | BriefView              | Nice to have                  |
Ctrl+Shift+L  | ThumbnailsView         | Nice to have                  |
Ctrl+Shift+U  | PanelsSplitterPerPos   | Nice to have                  | splitpct=50
Ctrl+Shift+I  | PanelsSplitterPerPos   | Nice to have                  | splitpct=70
Ctrl+Shift+O  | PanelsSplitterPerPos   | Nice to have                  | splitpct=100
Ctrl+Shift+H  | HorizontalFilePanels   | Nice to have                  |
Shift+f       | DirHotList             | Not really                    |
Ctrl+h        | DirHistory             | Not really                    |
Ctrl+Alt+,    | ShowCmdLineHistory     | Not really                    |
Ctrl+N        | OpenDirInNewTab        | Nice to have                  |
Ctrl+1        | NewTab                 | Nice to have                  |
Super+h       | LeftOpenDrives         | Nice to have                  |
Super+n       | RightOpenDrives        | Nice to have                  |
Ctrl+,        | ChangeDirToHome        | Nice to have                  |
Ctrl+Tab      | ChangeDirToRoot        | Nice to have                  |

#### Assumed to be default
Mappings which are default or which should be default.

Shortcut      | Function       | Left hand only | Comment
------------- | -------------  | -------------  | -------------
Ctrl+a        | MarkMarkAll    | Yes            |
Shift+Ctrl+a  | MarkUnmarkAll  | Yes            | Default behavior from Gimp.
Ctrl+i        | MarkInvert     | Nice to have   | Default behavior from Gimp.
Ctrl+d        | Delete (Trash) | Yes            |
Shift+Ctrl+d  | Delete         | Yes            |

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

## Terminal programs

### Tmux

See [.tmux.conf][] …

### Vim

See [.vimrc][] (Folds *Key (re)Mappings* and *Bundles and plugins*) …

Use Neo2 bindings where possible. Don‘t use `$`, use Mod4+g.

* Use one key with modifiers for actions which might be used repeatable or
  toggle something like | in normal mode which toggles comments for the line or ❤ (Shift+Layer3Mod+w) which closes one window or split.

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
