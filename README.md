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


## Special keys
Key name      | Comment
------------- | -------------
Level5 Shift  | This key is in my configuration the <> button.
+             | Seperator for keys
anything else | is either a usual key name or a regular expression to specific a range of keys

## Window manager (Gnome3)

Own shortcuts for the window manager should include the Super key which is normally not used by applications.

### Navigation

Shortcut                              | Function                               | Left hand only | Comment
-------------                         | -------------                          | -------------  | -------------
Alt+A                                 | Move window one workspace to the left  | Yes            | Currently not used, just defined to be consistent.
Alt+D                                 | Move window one workspace to the right | Yes            | Currently not used, just defined to be consistent.
Alt+W                                 | Move window one workspace up           | Yes            |
Alt+S                                 | Move window one workspace down         | Yes            |
Alt+[Level5 Shift][special-keys]      | Switch windows                         | Of course      | Easier to reach than Alt-Tab
Super+j                               | Switch to next windows                 | No             | See [shellshape][].
Super+k                               | Switch to previous windows             | No             | See [shellshape][].
Ctrl-Alt+y                            | Switch to workspace 1                  | Of course      |
Ctrl-Alt+[Level5 Shift][special-keys] | Switch to workspace 2                  | Of course      |

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
Ctrl+Alt+f    | Toggle fullscreen mode | Yes            | If Alt-f does not work
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

## GUI applications

### Windows and tabs

Applies for: firefox, gnome-terminal, Double Commander (not fully yet because some are not configurable)

Ctrl commands have to be used with Shift in the terminal emulator.

Shortcut      | Function                           | Left hand only | Comment
------------- | -------------                      | -------------  | -------------
Ctrl+n        | Opens a new (preferably empty) tab | No             | Easier to reach than C-t
Alt+m         | Switch to tab 1                    | No             | See [Neo2 layer4][Neo2]
Alt+,         | Switch to tab 2                    | No             |
Alt+.         | Switch to tab 3                    | No             |
Alt+j         | Switch to tab 4                    | No             |
Alt+k         | Switch to tab 5                    | No             |
Alt+l         | Switch to tab 6                    | No             |
Alt+u         | Switch to tab 7                    | No             |
Alt+i         | Switch to tab 8                    | No             |
Alt+o         | Switch to tab 9                    | No             |
Ctrl+w        | Closes the tab                     | Of course      | Should be default in all program
Ctrl+q        | Closes the application             | Of course      | Should be default in all program

### Firefox

I use [VimFx][] with a few modified and additional shortcuts …

### Double Commander (DC)

See the manual for the default shortcuts. I added my own which I think are more convenient (I left the original onces pretty much untouched):

Shortcut      | Function      | Left hand only                | Comment
------------- | ------------- | -------------                 | -------------
/             | Quick search  | Yes (maybe copy paste search) | Entered with Mod3 (caps lock key) and s
ö             | Quick search  | Yes (maybe copy paste search) | Currently used
Ctrl+e        | Copy          | Yes                           |
Ctrl+D        | Delete        | Yes                           |
Ctrl+Y        | MakeDir       | Yes                           |
Ctrl+a        | MarkAll       | Yes                           |
Ctrl+A        | UnmarkAll     | Yes                           | Default behavior from Gimp
Ctrl+S        | RunTerm       | Not really                    | Like Ctrl+Super+s but with the current directory
Ctrl+l        | FocusCmdLine  | Not really                    | Was mapped to Shift+F2 but Ctrl+l is more confinient because it works be default in firefox. Overwrites CalculateSpace in DC.

Note: Double Commander works quite nicely together with [Neo2][] …

## Terminal programs

### Tmux

See [.tmux.conf][] …

### Vim

See [.vimrc][] (Folds *Key (re)Mappings* and *Bundles and plugins*) …

<!-- links -->

[VimFx]: www.github.com/akhodakivskiy/VimFx
[special-keys]: #special-keys
[.vimrc]: /.vimrc
[.tmux.conf]: /.tmux.conf
[suspend-script]: https://github.com/ypid/scripts/blob/master/suspend-via-gnome
