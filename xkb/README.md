# My X keyboard extension configuration

I highly customized my keyboard layout for optimal efficiency and ergonomics. It is a mix between the default German qwertz (which I was used to) and the awesome [Neo2][] layout. I decided to mix those two layouts because I could not force myself to entirely switch to [Neo2][] and because I wanted to be able to shortly use other systems without more pain than necessary.

I started with a .Xmodmap file and it did almost all what I wanted but certain things could not be accomplished xmodmap. So I decided to implement my layout using xkb.

This file (de) is my modified replacement for the default keyboard layout definition. For this to work the current version of the [Neo2][] xkb files need to be present. See [this page](http://wiki.neo-layout.org/wiki/Neo%20unter%20Linux%20einrichten/xkbmap).

To use my modified version you need to copy the file de over to:

`cp de /usr/share/X11/xkb/symbols/de`

[Neo2]: http://www.neo-layout.org/
