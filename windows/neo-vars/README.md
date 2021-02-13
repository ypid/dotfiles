# Neo-Vars

This implements my [keyboard layout neo_qwertz](/docs/keyboard.md) on Windows.

My custom Autohotkey configuration is included as
[./source/custom.ahk](/windows/neo-vars/source/custom.ahk) which provides some
convenience for working on a Windows system. It provides as much of the
shortcuts listed in my [shortcuts docs](/docs/shortcuts.md) as possible.

I think of `qNeo2_ypid_custom.exe` as the main abstraction layer between my brain and Windows. It abstracts Windows away and offers me a generic UI that behaves the same across operating systems. This UI is optimized to be interfaced with a keyboard.

The upstream source code can be found in https://github.com/neo-layout/neo-layout/tree/master/windows/neo-vars/src.

## Usage

Start `qNeo2_ypid_custom.exe` as root. Normal user also works but not in application instances running under different user context (example, elevated permissions).

## Compatibility

* Windows 7 (With limits, Higher layers might "lock", like caps lock)
* Windows 10 ~~Pro~~ Contra X86_64 1607, 1803 and 1909 (Fully working)

## Caveats

* Does not work in MS Shell terminal emulator when running as admin. The keyboard layout is "reverted" to the default one. This seems to be a security feature because qNeo2 works when running Powershell in user context.

* Some other quirks when working longer over Cygwin ssh or Putty on a Linux server and making heavy use of qNeo2. This is really bad on Windows 7. On Windows 10, it is partially resolved.

## Develop

### Install Autohotkey

Use Autohotkey version between 1.1.15.0 and 1.1.25.02 to compile. [Others are known to cause issues!](https://git.neo-layout.org/neo/neo-layout/issues/504) For more infos, see https://git.neo-layout.org/neo/neo-layout/wiki/Neo-unter-Windows-einrichten-(NeoVars)

Install via:

```dosbatch
cinst -y autohotkey autohotkey.install --version 1.1.24.02 --allow-downgrade
choco pin add -n='autohotkey'
choco pin add -n='autohotkey.install'
```

(Or download it from https://autohotkey.com/download/)

### Compile

Run `C:/Program Files/AutoHotkey/Compiler/Ahk2Exe.exe` and select "Unicode 32-bit.bin".
