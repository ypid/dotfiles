# Neo-Vars

This implements my [qNeo2](/qNeo2/) on Windows.

My custom Autohotkey configuration is included as ./source/custom.ahk which
provides some convenience for working on a Windows system. It provides as much
of the shortcuts listed in my [shortcuts docs](/shortcuts.md) as possible.

## Usage

Start neo20-all.exe as root.

## Develop

### Install Autohotkey

Use Autohotkey version between 1.1.15.0 and 1.1.25.02 to compile. Others are known to cause issues! For more infos, see https://wiki.neo-layout.org/wiki/Neo%20unter%20Windows%20einrichten/NeoVars

Install via:

```dosbatch
cinst -y autohotkey autohotkey.install --version 1.1.24.02 --allow-downgrade
choco pin add -n='autohotkey'
choco pin add -n='autohotkey.install'
```

(Or download it from https://autohotkey.com/download/)

### Compile

To compile, run C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe
and select "Unicode 32-bit.bin".
