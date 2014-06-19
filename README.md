This git repo tracks a few of my personal config files for some programs.

# Contents

`.zshrc`
> My ZSH configuration, mostly based on [oh-my-zsh][]

` .zsh_bindings`
> My key bindings for ZSH. Mainly history-beginning-search and all that good stuff.

`.bashrc`
> .bashrc to enable color, read other files and so on

` .shellrc`
> Common configuration parsed by all shells (Bash and ZSH)

`.shell_public`
> Shell alias and other settings

`.gitconfig`
> Configuration for git including a few aliases

`.gitignore_global`
> Global gitignore list

`.hgrc`
> Configuration for hg

`.perlcriticrc`
> Disabling some rules for perlcritic

`.perltidyr`
> My thoughts about how Perl code should look like

`.pystartup`
> Enable history and load some common modules

`.tmux.conf`
> Use some key mappings from screen

`.vim`
> All my plugins and stuff like

`.vimrc`
> My vimrc (work in progress)

`.vimpagerrc`
> Lightweight Vim configuration for using Vim as pager

`xkb/`
> My keyboard layout (mix between qwertz and [Neo2][] which I later refer to as qNeo2).

[oh-my-zsh]: http://github.com/robbyrussell/oh-my-zsh
[Neo2]: http://www.neo-layout.org/

# Shortcuts

Here are some common shortcuts that I use and which I configure in every program which makes sense and allows to do so.

The use of the shift modifier key is not explicitly written down (-> case sensitive).

Left hand only: Should be easy to use with the left hand, because it is often used during work with the mouse. For example switching windows or Ctrl+c to copy to the clipboard.

## Advises: Shortcuts done right

Here are some advices regarding shortcuts for programmers or UI designers which I would like to see implemented:

* Allow more than one shortcut for one action!
* Allow to reconfigure *everything*.
* Make it easy to track the configuration files (which contain the shortcuts) with version control.
* Do not reinvent the wheel!

Additionally, some thoughts (or personal wishes):

* Every application which works with text or has and text input field should support Ctrl+u in the way Vim does it. (I am often trying to delete the complete text in the URL Bar in Firefox with Ctrl+u …)

## Shortcut “Namespaces”

Which shortcuts should be used where? – Some thoughts …

Super key:

* Without other modifiers only for the Window manager or AutoKey


## Special keys
Key name      | Comment
------------- | -------------
Level5 Shift  | This key is in my configuration the <> button.
+             | Seperator for keys
anything else | is either a usual key name or a regular expression to specific a range of keys

## Window manager (Gnome3)

Own shortcuts for the window manager should include the Super key which is normally not used by applications.

### Navigation

Shortcut                              | Function                                  | Left hand only | Comment
-------------                         | -------------                             | -------------  | -------------
Alt+A                                 | Move window one workspace to the left     | Yes            | Currently not used, just defined to be consistent.
Alt+D                                 | Move window one workspace to the right    | Yes            | Currently not used, just defined to be consistent.
Alt+W                                 | Move window one workspace up              | Yes            |
Alt+S                                 | Move window one workspace down            | Yes            |
Alt+[Level5 Shift][special-keys]      | Switch windows                            | Of course      | Easier to reach than Alt-Tab
Super+j                               | Switch to next windows                    | No             | See [shellshape][].
Super+k                               | Switch to previous windows                | No             | See [shellshape][].
Super+d                               | switch workspace to vertical tiled mode   | Yes            | See [shellshape][].
Super+f                               | switch workspace to floating mode         | Yes            | See [shellshape][].
Super+g                               | switch workspace to horizontal tiled mode | Yes            | See [shellshape][].
Super+J                               | swap with next window                     | No             | See [shellshape][].
Super+K                               | swap with previous window                 | No             | See [shellshape][].
Super+m                               | minimize window                           | No             | See [shellshape][].
Super+M                               | un-minimize last window                   | No             | See [shellshape][].
Super+h                               | shrink master area                        | No             | See [shellshape][].
Super+l                               | grow master area                          | No             | See [shellshape][].
Super+u                               | shrink a slave area                       | No             | See [shellshape][].
Super+i                               | grow a slave area                         | No             | See [shellshape][].
Super+H                               | decrease window's width                   | No             | See [shellshape][].
Super+L                               | increase window's width                   | No             | See [shellshape][].
Super+U                               | decrease window's height                  | No             | See [shellshape][].
Super+I                               | increase window's height                  | No             | See [shellshape][].
Super+z                               | toggle window maximized state             | No             | See [shellshape][].
Alt+Super+j                           | go to workspace below                     | No             | See [shellshape][].
Alt+Super+k                           | go to workspace above                     | No             | See [shellshape][].
Alt+Super+J                           | move window to workspace below            | No             | See [shellshape][].
Alt+Super+K                           | move window to workspace above            | No             | See [shellshape][]. Could release Alt+[WASD]?
Super+a                               | bring window to front / send to back      | No             | See [shellshape][].
Super+C                               | close window                              | No             | See [shellshape][]. Does not work. Not using it.
Ctrl-Alt+y                            | Switch to workspace 1                     | Of course      |
Ctrl-Alt+[Level5 Shift][special-keys] | Switch to workspace 2                     | Of course      |

[shellshape]: https://extensions.gnome.org/extension/294/shellshape/

### Sound and Media

Shortcut                                | Function      | Left hand only | Comment
-------------                           | ------------- | -------------  | -------------
Ctrl+Super+y                            | Volume up     | Yes            | Maybe other shortcut?
Ctrl+Super+[Level5 Shift][special-keys] | Volume down   | Yes            | Maybe other shortcut?

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

Shortcut      | Function               | Left hand only | Comment
------------- | -------------          | -------------  | -------------
Ctrl+Q        | Close window           | Yes            | If Ctrl-q does not work, defined in gnome-terminal by default
Ctrl+Alt+f    | Toggle fullscreen mode | Yes            | If Alt-f does not work. Try to use Ctrl+Alt+f because it is more generic.
Ctrl+Alt+w    | Maximize window        | Yes            |
Ctrl+Alt+a    | View split on left     | Yes            |
Ctrl+Alt+d    | View split on right    | Yes            |

### Custom shortcuts

Shortcut         | Function                                   | Left hand only | Comment
-------------    | -------------                              | -------------  | -------------
Ctrl+Super+s     | Launch program `x-terminal-emulator`       | Yes            |
Ctrl+Super+[1-9] | Launch custom program or script            | Yes and no     |
Ctrl+Alt+x       | `rhythmbox-client --play-pause`            | Of course      | Play or pause music
Ctrl+Super+x     | `rhythmbox-client --next`                  | Of course      | Play next music file
Ctrl+Alt+O       | Launch program `eject`                     | No             | eject removable media
Ctrl+Alt+c       | Launch [script][suspend-script] to suspend | Yes            |
Ctrl+Alt+v       | poweroff                                   | Yes            |

### Autokey

Here are the shortcuts I use to trigger [autokey][] actions.

#### Emitted keystrokes

Shortcut      | Function      | Left hand only | Comment
------------- | ------------- | -------------  | -------------
Super+v       | enter         | Yes            | Emit enter. If AltGr+v does not work (unfortunately AltGr can currently not be used in autokey).

## GUI applications

### Windows and tabs

Applies for: firefox, gnome-terminal, Double Commander (not fully yet because some are not configurable)

For gnome-terminal, each shortcut requires the use of the Shift modifier key.

Ctrl commands have to be used with Shift in the terminal emulator.

Shortcut      | Function                                | Left hand only | Comment
------------- | -------------                           | -------------  | -------------
Ctrl+n        | Opens a new (preferably empty) tab      | No             | Easier to reach than C-t
Ctrl+tab      | Swtich to right tab, cicle through tabs | Yes            |
Ctrl+j        | Swtich to left tab                      | Not really     |
Ctrl+k        | Swtich to right tab                     | Not really     |
Alt+m         | Switch to tab 1                         | No             | See [Neo2 layer4][Neo2]. Maybe blocks the use of Alt+[a-z]. I hope that most applications use letters which would be on the left side of qwertz
Alt+,         | Switch to tab 2                         | No             |
Alt+.         | Switch to tab 3                         | No             |
Alt+j         | Switch to tab 4                         | No             |
Alt+k         | Switch to tab 5                         | No             |
Alt+l         | Switch to tab 6                         | No             |
Alt+u         | Switch to tab 7                         | No             |
Alt+i         | Switch to tab 8                         | No             |
Alt+o         | Switch to tab 9                         | No             |
Ctrl+[+-]     | Increase/Decrease font size             | Nice to have   | Level 3 [Neo2][] plus and minus do not work in firefox. Using Level 4 once (which currently don’t work with gnome-terminal).
Ctrl+w        | Closes the tab                          | Of course      | Should be default in all program
Ctrl+q        | Closes the application                  | Of course      | Should be default in all program

### Firefox

I use [VimFx][] with a few modified and additional shortcuts …

### Double Commander (DC)

See the manual for the default shortcuts. I added my own which I think are more convenient (I left the original onces pretty much untouched):

Shortcut      | Function      | Left hand only                | Comment
------------- | ------------- | -------------                 | -------------
/             | Quick search  | Yes (maybe copy paste search) | Not used. Configured DC so that every letter typed will open the quick search.
ö             | Quick search  | Yes (maybe copy paste search) | Not used. Configured DC so that every letter typed will open the quick search.
Alt+Y         | Delete        | Yes                           |
Alt+X         | Rename        | Yes                           |
Alt+C         | Copy          | Yes                           |
Alt+E         | Symlink       | Yes                           |
Alt+Q         | QuickView     | Yes                           |
Alt+J         | MakeDir       | Not really                    | I suppose I will have to type a directory name then
Ctrl+J        | SortByName    | Nice to have                  |
Ctrl+K        | SortByExt     | Nice to have                  |
Ctrl+L        | SortBySize    | Nice to have                  |
Ctrl+U        | SortByDate    | Nice to have                  |
Ctrl+a        | MarkAll       | Yes                           |
Ctrl+A        | UnmarkAll     | Yes                           | Default behavior from Gimp
Ctrl+S        | RunTerm       | Not really                    | Like Ctrl+Super+s but with the current directory
Ctrl+l        | FocusCmdLine  | Not really                    | Was mapped to Shift+F2 but Ctrl+l is more confinient because it works be default in firefox. Overwrites CalculateSpace in DC.

Note: Double Commander works quite nicely together with [Neo2][] …

### ERP system Steps Ahead

This section describes some mapping which I added to make working with the ERP system [Steps Ahead][] more pleasant. I am relaying on an ugly hack to achieve this because [Steps Ahead][] (even in the current version 9.5.3) does not allow to remap or add shortcuts to actions which already have a default shortcut … So I use [autokey][] to do this anyway. It works the following: When autokey intercepts one of the following shortcuts it emits the shortcut on which Steps Ahead triggers the desired action.

Shortcut      | Function                          | Left hand only | Comment
------------- | -------------                     | -------------  | -------------
Super+s       | Clone dataset (copy and paste it) | Yes            | Emits Shift+F6 followed by enter (to acknowledge the „Do you really want to copy …“ dialog).
Super+r       | Reload                            | Yes            | Emits F5. Could also be useful for other applications.

## Terminal programs

### Tmux

See [.tmux.conf][] …

### Vim

See [.vimrc][] (Folds *Key (re)Mappings* and *Bundles and plugins*) …

#### Free shortcuts
List of free shortcuts (they may have a default mapping but there are better shortcuts for those actions so that the shortcuts are available to be mapped to a different action).

##### Normal mode

* Umlauts
* Shift+Space

<!-- links -->

[VimFx]: www.github.com/akhodakivskiy/VimFx
[special-keys]: #special-keys
[.vimrc]: /.vimrc
[.tmux.conf]: /.tmux.conf
[suspend-script]: https://github.com/ypid/scripts/blob/master/suspend-via-gnome
[autokey]: https://code.google.com/p/autokey/
[Steps Ahead]: https://de.wikipedia.org/wiki/Steps_Ahead
