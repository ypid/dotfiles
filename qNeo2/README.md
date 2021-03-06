# My X keyboard extension configuration

My keyboard layout (mix between QWERTZ and [Neo2][] which I later refer to as qNeo2).

I highly customized my keyboard layout for optimal efficiency and ergonomic. It is a mix between the default German QWERTZ (which I was used to) and the awesome [Neo2] layout. I decided to mix these two layouts because I could not force myself to entirely switch to [Neo2] and because I wanted to be able to shortly use other systems without more pain than necessary.

## Xmodmap
I started with a `.Xmodmap` file and it did almost everything what I wanted but certain things could not be accomplished with `xmodmap`:

* Settings like producing the symbol '0' with:

  ```
  <Alt Gr> + <space>
  ```

  did not work.
* Xmodmap settings where reset when switching to another virtual consoles.
* No easy and/or fast way to switch to the normal QWERTZ layout (the `xmodmap` command usually took it‘s 5 seconds to terminate).
* Could only be used when logged in not before (I had to remember if my settings where already in effect when typing in passwords).

So I decided to implement my layout using xkb.

## xkb

I just modified the original neo definition in the de symbols file.

To use my modified version just run the deploy script as root:

```Shell
./deploy
```

Then either enable 'German (Neo 2)' in your window manager (for example Gnome 3) or run `./enable` (in as normal user).

After enabling it, your default keyboard layout will be [Neo2] with the QWERTZ layout. The Gnome keyboard tool can show you the mapping for all keys. Also the program [NeoLayoutViewer] can be used to quickly look up the [Neo2] layout.

Note that you can switch to the normal layout (as specified in the keyboard file) with the [scroll lock key](http://en.wikipedia.org/wiki/Scroll_lock) or with tools your window manager provides.

### Known issues

* On openSUSE in a VirtualBox VM the Shift+Layer3Mod+s ι and other greek signs can not be entered. Remapping the key in symbols/de to a sign which works does not help. xev stays quite when Shift+Layer3Mod+s is pressed.

### Legacy

On older systems you might need the current version of the [Neo2] xkb files before copying over the de file. See [the Wiki page about installing Neo2](http://wiki.neo-layout.org/wiki/Neo%20unter%20Linux%20einrichten/xkbmap).


## Autohotkey on M$ Windows

Refer to [neo-vars](/windows/neo-vars/) for details.

[NeoLayoutViewer]: https://github.com/YggdrasiI/NeoLayoutViewer
[Neo2]: https://www.neo-layout.org/
