@echo off

rem Start this legacy bat script is scheduled task at user login to ensure the following scripts run as root.

start %HOMEPATH%\.config\dotfiles\windows\neo-vars\qNeo2_ypid_custom.exe
timeout 1 > NUL

start %HOMEPATH%\.config\dotfiles\windows\virtual-desktop-enhancer\virtual-desktop-enhancer.exe
