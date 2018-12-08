# ypid dotfiles on Windows

Making Windows behave like my customized Unix work environment.

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
   with a OpenPGP signature and then push it upstream. As stated elsewhere, assume
   everything not signed by me to be forged/not from me.

Q: Did any of your private OpenPGP keys ever get exposed to a Windows system or will they in the future?<br>
A: Silly? No, never.

PS: https://getgnulinux.org/

## Install

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
