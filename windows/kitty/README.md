# KiTTY

Comparing KiTTY with 0.73.0.1p with PuTTY 0.73.

Pro KiTTY:

* Portable mode: Supports to save session profiles and ssh host keys (known hosts) to configuration file.
* Timestamp for logging.

Neutral:

* Save passwords. (Use it wisely). Can also be done with PuTTY: https://superuser.com/questions/44106/is-there-a-way-to-auto-login-in-putty-with-a-password

Contra KiTTY:

* Not in Debian.
* No GNU/Linux build.
* Less trustworthy than PuTTY.

## Install

https://chocolatey.org/packages/kitty

Install with the Portable parameter because this sets `savemode=dir` automatically for us.

```dosbatch
choco install kitty --params "/Portable"
```

Deployment tip: System defaults can be provided as `C:/ProgramData/Chocolatey/lib/kitty/tools/Sessions/Default%20Settings`

## Configuration

Refer to ../../install.ps1.

Ref: https://github.com/cyd01/KiTTY/issues/70
