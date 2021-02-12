# GNU/Linux workstation for people forced to have Windows

~~Making Windows behave like my customized Unix work environment.~~
2021: A behavior like Unix does not cut it, see below.

## FAQ

Q: Silly, you use Windows?<br>
A: Only at work. Some companies might require me to run Windows on bare metal.
   Migrating to Qubes OS would fully solve this by allowing me to exclude Windows
   from my [TCB] at work. Until then, this is just my attempt to move Windows out
   of my way so that I can get my [FLOSS] work done.

Q: Is Windows trustworthy?<br>
A: Silly? No. Assume Windows and other non-free software to be permanently compromised.

Q: Can I trust your [Free Software] which was written at work?<br>
A: For the most part yes and here is why. I understand that every system which
   has Windows in it’s [TCB] is by definition untrustworthy. That is why I review
   every commit I make on my personal computer running Qubes OS, sign the commit
   with a OpenPGP signature and then push it upstream.

   ~~As stated elsewhere, assume everything not signed by me to be forged/not from me.~~

   I now use the account https://github.com/ypid-geberit to open PR against projects. The idea is
   that those PRs are reviewed upstream anyway so I don’t necessarily need to
   sign them which means extra work for me.
   I don’t really see the point in using a YubiKey to do signatures there because the
   basic problem remains. Windows is not trustworthy so I could accidentally
   sign anything there without knowing it.
   I guess there is still value in using a YubiKey if it has a battery-backed
   RTC so that at least what I signed can be time checked so it at least forces
   the advisory to have recent access to my YubiKey. Lets see, I might go that
   route.

Q: Did any of your private OpenPGP keys ever get exposed to a Windows system or will they in the future?<br>
A: Silly? No, never.

PS: https://getgnulinux.org/

## Install on Windows

To use my configuration run the following commands to download it:

```Shell
if (! (test-path '~/.config')) { mkdir '~/.config' }; if (! (test-path '~/.config/dotfiles')) { git clone --recursive "https://github.com/ypid/dotfiles.git" }
```

Installation is handled by a custom MS Shell script called [`install.ps1`](/install.ps1) inside `~/.config/dotfiles`.

## Contents

Check the [`install.ps1`](/install.ps1) file to see my active configuration and where it is linked to.

[Free Software]: https://fsfe.org/about/basics/freesoftware.html
[FLOSS]: https://en.wikipedia.org/wiki/Free_and_open-source_software
[TCB]: https://en.wikipedia.org/wiki/Trusted_computing_base

## Real GNU/Linux environment

Last reevaluation: 2021-01

This section is for people who prefer working inside a real GNU/Linux
environment because they found any hack or emulation to not cut it or they
simply do not want to waste their time with trying to setup some form of
emulation in the first place.

### History

For historic reasons, most companies still restrict themselves to Windows as
their (only) supported client OS. Developers, sysadmins and other power users
see the limitations of this and prefer a more suitable (Unix based) OS like
GNU/Linux or for the sake of it even macOS.

To comply with company policy, this usually ends up in something like this:

* Terminal over SSH on a real GNU/Linux server and do most work there.
* WSL2 and Windows terminal.
* Running a VM in full screen.
* Qubes OS.

Only the last two provide a real GNU/Linux environment. The first two are just
an emulation and you will run into issues often.

Even though WSL is currently hip I suggest not to use it if you are a GNU/Linux
power user already. I see this as an attempt to keep users locked in the
Windows ecosystem while giving them enough GNU/Linux to not escape. Do not
fall for this this! It is a slippery slope I can tell you from experience. WSL
can be nice and easy to introduce people to GNU/Linux however.

### Setup

Your favorite GNU/Linux distro in VirtualBox with VirtualBox Guest Additions
installed. It is as simple as that. As of 2021 this is fast enough to use it
all day long. Certainly better behaving than alternative emulations (see
history).

Anything else you can probably figure out yourself. I will just leave you with
a few keywords here to get you started:

* Use https://chocolatey.org/ to install your dependencies on Windows: `choco install -y virtualbox vagrant microsoft-windows-terminal`
* Get your distro installed and configured as you like it automatically using Vagrant.
* For quick switching between guest and host OS, use the VirtualBox "Host key combination". See also https://github.com/ypid/dotfiles/blob/master/docs/shortcuts.md

### TODOs/limitations

* Video playback is too slow in the VM. Maybe there is a way to pass the GPU or something to make it work.
* Use Hyper-V backend or something else?
* Default backend with Hyper-V enabled causes long lasting disk IO read bursts.

### Reevaluation 2021-01

* Test Hyper-V. Would be the easiest way to run Linux on my desktop.
  Dead end for now: https://github.com/microsoft/linux-vm-tools/issues/28
  * I did not get xrdp to work with Hyper-V.
  * As soon as Hyper-V is open it messes with Neo2.
* NoMachine to hyper-V Ubuntu 20.04 VM
  Better than Hyper-V but still too slow.
  Not Open Source.
* X2Go to hyper-V Ubuntu 20.04 VM
  Better than NoMachine but still too slow.
  Youtube playback uses 100 % CPU
* WSL2 with Ubuntu fully patched. Too slow opening a new terminal with my zsh config. Slower than via KiTTY on real Linux.
* VcXsrv to WSL1 Ubuntu 20.04
  Vim is slower than with Microsoft Terminal.
* X2Go to WSL1 Ubuntu 20.04
  Slower than VirtualBox
* Test some remote desktop protocol that does not suck to access a Linux GUI host from Windows.
* WSL2 with Microsoft Terminal
