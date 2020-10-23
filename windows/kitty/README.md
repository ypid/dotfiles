# KiTTY

Comparing KiTTY with 0.73.0.1p with PuTTY 0.73.

Pro KiTTY:

* Portable mode: Supports to save session profiles and ssh host keys (known hosts) to configuration files.
* Timestamp for logging.

Neutral:

* Save passwords. (Use it wisely). Can also be done with PuTTY: https://superuser.com/questions/44106/is-there-a-way-to-auto-login-in-putty-with-a-password

Contra KiTTY:

* Not in Debian.
* No GNU/Linux build.
* Less trustworthy than PuTTY.

## Software install

https://chocolatey.org/packages/kitty

Install with the Portable parameter because this sets `savemode=dir` automatically for us.

```dosbatch
choco install kitty --params "/Portable"
```

Deployment tip: System defaults can be provided as `C:/ProgramData/Chocolatey/lib/kitty/tools/Sessions/Default%20Settings`

## Configuration install

Two options exist, either manual or automated.

Note that the default settings cannot be symlinked because of https://github.com/cyd01/KiTTY/issues/70. It will be copied with both installation methods.

## Manual configuration install

1. Start KiTTY once to let it create its local config dir with default config and close it again to ensure that it does not get in the way.
2. Download [`Default%20Settings`](./Sessions/Default%20Settings) and put it into `%LOCALAPPDATA%\VirtualStore/ProgramData/Chocolatey/lib/kitty/tools/Sessions`. Be sure that the file is named exactly like that. You will need to overwrite the file that KiTTY just created.
3. Create the directory hierarchy `C:/var/log/kitty_sessions` to allow KiTTY to store session logs there.

## Automated configuration install

1. Review and run [`../../install.ps1`](../../install.ps1). Note that this script installs all Windows related dotfiles in this repo, not just KiTTY. You may want to edit the script to only execute the KiTTY related things.
2. Review and run [`../../install_fhs.ps1`](../../install_fhs.ps1) to create the required directory hierarchy.

## Settings

Explanation of non-default settings. You can compare my settings to the default once by deleting the session default file, letting the latest KiTTY version recreate it and then use the git clean filter from this repo to sort the file when diffing.

```
NoApplicationKeys\1\
;; "Terminal" -> "Features" -> "Disable application keypad mode" -> checked
;; The Neo2 keyboard layout has an integrated keypad mode. Application keypad mode must be disabled so that the neo-vars implementation allows to enter numbers in layer 4.

AltSpace\1\
;; "Window" -> "Behaviour" -> "System menu appears on ALT-Space" -> checked
;; Required for my custom shortcuts. Ref "Duplicate session in Putty based programs": https://github.com/ypid/dotfiles/blob/master/windows/neo-vars/source/custom.ahk

ConnectionSharing\1\
;; "Connection" -> "SSH" -> "Share SSH connections if possible" -> checked
;; Works when "Connection" -> "Data" -> "Auto-login username" is filled out. Is quite handy for duplicating sessions. It is assumed this works like connection sharing from OpenSSH thus no password is cached thus not a security risk.

Wordness*
;; Configures what KiTTY considers a "word". This determines how far the selection is expanded when clicking on something.
;; Configured so that file paths are usually selected completely. For example the `~` character is included.

SaveOnExit\1\
;; "Window" -> "Behaviour" -> "Save position and size on exit"
;; Comes in handy specially when duplicating sessions to have a predictable behavior (same as original session).
;; One has window manager shortcuts to quickly reposition windows as needed.

LogFileName "C:/var/log/kitty_sessions/&H_&Y-&M-&DT&T.log"
;; Example: C:/var/log/kitty_sessions/localhost_2020-07-02T124741.log
;; "Session" -> "Logging" -> "Log file name"

LogTimestamp "%Y-%m-%d %H:%M:%S "
;; "Session" -> "Logging" -> "Timestamp"
;; Used to prefix every log line. RFC 3339 compliant (KiTTY cannot include the time zone) with focus on human readability.
```
