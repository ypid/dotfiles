<!--
SPDX-FileCopyrightText: 2012-2021 Robin Schneider <ypid@riseup.net>

SPDX-License-Identifier: CC-BY-SA-4.0
-->

# ypid dotfiles

My customized Unix work environment.

Enjoy.

## Supported on

* Debian 12

Note: Support for Windows 10 will not be continued but is still contained in this
repo for historic reasons.

## Install

Installation is handled by [dotbot](https://github.com/anishathalye/dotbot).

There are two strategies to install it:

### Editable installation

This will leave you with a hackable checkout with the full history:

```Shell
git clone https://github.com/ypid/dotfiles.git ~/.config/dotfiles
cd ~/.config/dotfiles
./get     # Will download all the dependencies.
./install # Links the config from the repo to the current $HOME dir.
```

On Windows those steps should work in a Git Bash as administrator.

### Read-only installation

For secure, self-hosted distribution of my dotfiles to servers, clients and
Qubes OS AppVMs I choose the approach to have a checkout (without the `.git`)
at `/usr/local/share/ypid_dotfiles/` and than `/etc/skel/.config/dotfiles`
symlinks to it. With this, I can easily enable my dotfiles for new users as
needed. This comes in handy when different accounts are used for separation.

Pro:

* With history, my dotfiles (mainly caused by the hundreds of git submodules
  included) is 400 MiB in size. This space is used only once per system as all
  user accounts just symlink to it. Note that I don’t deploy those 400 MiB to
  servers in practice. My Ansible role
  [ypid.dotfiles](https://github.com/ypid/ansible-dotfiles) strips most of this
  out and brings down the size to 70 MiB.
* It allows to update most of the configuration files per system instead of per
  user account.

Contra:

* `/usr/local/share/ypid_dotfiles/` is not writable so the installer needs to
  handle some configs differently where the program needs write access to it’s
  own config file for normal operation.

Refer to the [Ansible role
ypid.dotfiles](https://github.com/ypid/ansible-dotfiles) for more details.

To overwrite files that were copied instead of symlinked use the following but
be warned that it will **overwrite** files in HOME:

```Shell
YPID_DOT_IGNORE_EXISTING="--recursive" ./install
```

## Contents

Check the [`install.conf.yaml`](/install.conf.yaml) file to see my active configuration and where it is linked to.
