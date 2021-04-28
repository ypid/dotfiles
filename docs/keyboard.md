# Keyboard layout configuration

My keyboard layout is a mix between QWERTZ and [Neo2] that XKB refers to as
`neo_qwertz`.

I decided to mix these two layouts for the following reasons:

* I see the main strength of Neo2 in the upper layers that allow to type
  special characters blind and without crazy hand movements.
* I could not force myself to entirely switch to [Neo2].
* I wanted to be able to shortly use other systems without more pain than necessary.

Luckily, others found this combination useful as well and contributed it
upstream to XKB and neo-vars, so on GNU/Linux, I don’t have to do any hacks as
I used in the past and can just run the following to enable it (temporarily):

```Shell
setxkbmap de neo_qwertz
```
## Autohotkey on M$ Windows

Refer to [neo-vars](/windows/neo-vars/) for details.

[NeoLayoutViewer]: https://github.com/YggdrasiI/NeoLayoutViewer
[Neo2]: https://www.neo-layout.org/
