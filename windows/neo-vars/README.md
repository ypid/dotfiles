# Neo-Vars

This implements my [qNeo2](/qNeo2/) on Windows.

My custom Autohotkey configuration is included as [./source/custom.ahk](/windows/neo-vars/source/custom.ahk) which
provides some convenience for working on a Windows system. It provides as much
of the shortcuts listed in my [shortcuts docs](/docs/shortcuts.md) as possible.

The upstream source code can be found in https://github.com/neo-layout/neo-layout/tree/master/windows/neo-vars/src.

## Usage

Start `qNeo2_ypid_custom.exe` as root. Normal user also works but not in application instances running under different user context (example, elevated permissions).

## Compatibility

* Windows 7 (With limits, Higher layers might "lock", like caps lock)
* Windows 10 ~~Pro~~ Contra X86_64 1607 and 1803 (Fully working)

## Develop

### Install Autohotkey

Use Autohotkey version between 1.1.15.0 and 1.1.25.02 to compile. [Others are known to cause issues!](https://wiki.neo-layout.org/ticket/504) For more infos, see https://wiki.neo-layout.org/wiki/Neo%20unter%20Windows%20einrichten/NeoVars

Install via:

```dosbatch
cinst -y autohotkey autohotkey.install --version 1.1.24.02 --allow-downgrade
choco pin add -n='autohotkey'
choco pin add -n='autohotkey.install'
```

(Or download it from https://autohotkey.com/download/)

### Compile

To compile, run C:/Program Files/AutoHotkey/Compiler/Ahk2Exe.exe
and select "Unicode 32-bit.bin".
