# My X keyboard extension configuration

I highly customized my keyboard layout for optimal efficiency and ergonomics. It is a mix between the default German qwertz (which I was used to) and the awesome [Neo2][] layout. I decided to mix those two layouts because I could not force myself to entirely switch to [Neo2][] and because I wanted to be able to shortly use other systems without more pain than necessary.

I started with a .Xmodmap file and it did almost all what I wanted but certain things could not be accomplished with xmodmap. So I decided to implement my layout using xkb.

This file (de) is my modified replacement for the default keyboard layout definition. For this to work the current version of the [Neo2][] xkb files need to be present. See [this page](http://wiki.neo-layout.org/wiki/Neo%20unter%20Linux%20einrichten/xkbmap).

To use my modified version just run the deploy script as root:

`./deploy`

Then either reboot or run `./enable` (in user space).

After enabling it, your default keyboard layout will be [Neo2] with the qwertz layout. The Gnome keyboard tool can show you the mapping for all keys. Also the program [NeoLayoutViewer][] can be used to quickly look up the [Neo2][] layout.

Note that you can switch to the normal layout (as specified in the keyboard file) with the [scroll lock key](http://en.wikipedia.org/wiki/Scroll_lock) or with tools you window manager provides.

[NeoLayoutViewer]: https://github.com/YggdrasiI/NeoLayoutViewer
[Neo2]: http://www.neo-layout.org/
