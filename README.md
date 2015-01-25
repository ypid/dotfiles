This git repo tracks a few of my personal config files for some programs.

# Install

To use this configuration run the following:

```Shell
./get    # Will download all the dependencies
./deploy # Links the config from the repo to the current $HOME dir. **Warning:** Your configuration will be deleted!
```

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
> Changed color stuff, show load and battery life and customized mappings

`.vim`
> All my plugins and stuff like that

`.vimrc`
> My vimrc (work in progress)

`.vimpagerrc`
> Lightweight Vim configuration for using Vim as pager

`xkb/`
> My keyboard layout (mix between qwertz and [Neo2][] which I later refer to as qNeo2).

[oh-my-zsh]: http://github.com/robbyrussell/oh-my-zsh
[Neo2]: http://www.neo-layout.org/
