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

## Special keys
Key name      | Comment
------------- | -------------
Level5 Shift  | This key is in my configuration the <>\| button.
+             | Seperator for keys
anything else | is either a usual key name or a regular expression to specific a range of keys

## Window manager (Gnome3)

### Navigation

Shortcut                              | Function                               | Comment
-------------                         | -------------                          | -------------
Alt+A                                 | Move window one workspace to the left  |
Alt+D                                 | Move window one workspace to the right |
Alt+W                                 | Move window one workspace up           |
Alt+S                                 | Move window one workspace down         |
Alt+[Level5 Shift][special-keys]      | Switch windows                         | Easier to reach than Alt-Tab
Super+j                               | Switch to next windows                 | See [shellshape][].
Super+k                               | Switch to previous windows             | See [shellshape][].
Ctrl-Alt+y                            | Switch to workspace 1                  |
Ctrl-Alt+[Level5 Shift][special-keys] | Switch to workspace 2                  |

[shellshape]: https://extensions.gnome.org/extension/294/shellshape/

### Sound and Media

Shortcut                                | Function      | Comment
-------------                           | ------------- | -------------
Ctrl+Super+y                            | Volume up     | FIXME
Ctrl+Super+[Level5 Shift][special-keys] | Volume down   | FIXME

### System

Shortcut        | Function      | Comment
-------------   | ------------- | -------------
Ctrl+Super+a    | Lock screen   |
Ctrl+Alt+Delete | Log out       |

### Typing

Shortcut      | Function                                            | Comment
------------- | -------------                                       | -------------
Alt+Super+c   | Switch to next input source (e.g. qNeo2 and qwertz) |

### Windows

Shortcut      | Function               | Comment
------------- | -------------          | -------------
Ctrl+Q        | Close window           | If Ctrl-q does not work, defined in gnome-terminal by default
Ctrl+Alt+f    | Toggle fullscreen mode | If Alt-f does not work
Ctrl+Alt+w    | Maximize window        |
Ctrl+Alt+a    | View split on left     |
Ctrl+Alt+d    | View split on right    |

### Custom shortcuts

Shortcut         | Function                            | Comment
-------------    | -------------                       | -------------
Ctrl+Super+s     | Start program `x-terminal-emulator` |
Ctrl+Super+[1-9] | Start program `$1`                  | Start some programs
Ctrl+Alt+x       | `rhythmbox-client --play-pause`     | Play or pause music
Ctrl+Super+x     | `rhythmbox-client --next`           | Play next music file
Ctrl+Alt+O       | Start program `eject`               | eject removable media

## GUI applications

### Windows and tabs

Applies for: firefox, gnome-terminal, Double Commander (not full yet because some are not configurable)

Ctrl commands have to be used with Shift in the terminal emulator.

Shortcut      | Function                           | Comment
------------- | -------------                      | -------------
Ctrl+n        | Opens a new (preferably empty) tab | Easier to reach than C-t
Alt+m         | Switch to tab 1                    | See [Neo2 layer4][Neo2]
Alt+,         | Switch to tab 2                    |
Alt+.         | Switch to tab 3                    |
Alt+j         | Switch to tab 4                    |
Alt+k         | Switch to tab 5                    |
Alt+l         | Switch to tab 6                    |
Alt+u         | Switch to tab 7                    |
Alt+i         | Switch to tab 8                    |
Alt+o         | Switch to tab 9                    |
Ctrl+w        | Closes the tab                     | Should be default in all program
Ctrl+q        | Closes the application             | Should be default in all program

### Firefox

I use [VimFx][] with a few modified and additional shortcuts …

### Double Commander

See the manual for the default shortcuts. I added my own which I think are more convenient (I left the original onces pretty much untouched):

Shortcut      | Function      | Comment
------------- | ------------- | -------------
/             | Quick search  | Entered with Mod3 (caps lock key) and s
Ctrl+e        | Copy          |
Ctrl+D        | Delete        |
Ctrl+Y        | MakeDir       |
Ctrl+a        | MarkAll       |
Ctrl+A        | UnmarkAll     | Default behavior from Gimp
Ctrl+S        | RunTerm       | Like Ctrl+Super+s but with the current directory

## Terminal programs

### Tmux

See [.tmux.conf][] …

### Vim

See [.vimrc][] (Folds *Key (re)Mappings* and *Bundles and plugins*) …

<!-- links -->

[VimFx]: www.github.com/akhodakivskiy/VimFx
[special-keys]: #special-keys
[.vimrc]: blob/master/.vimrc
[.tmux.conf]: blob/master/.tmux.conf
