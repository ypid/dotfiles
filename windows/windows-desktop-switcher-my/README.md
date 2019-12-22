# windows-desktop-switcher (custom)

I prefer https://github.com/pmb6tz/windows-desktop-switcher over https://github.com/sdias/win-10-virtual-desktop-enhancer. Not only because the later one is not maintained anymore but also because windows-desktop-switcher is much simpler and more native to someone who knows AutoHotKey anyway.

## Install

This directory holds my custom `user_config.ahk` for windows-desktop-switcher. Run the `install.ps1` script to symlinks `user_config.ahk` into the git submodule windows-desktop-switcher. I choose this symlinking approach to have a maintainable setup.

If you don’t like it fancy, feel free to just copy the `user_config.ahk` file over.

I also considered integrating this windows-desktop-switcher into my neo-vars directly to only have one exe to start but this does not work because windows-desktop-switcher needs to be compiled with the "Unicode 64-bit" (default) base file in `Ahk2Exe.exe` and neo-vars needs a different base file. So I cannot easily combine the two.

## Usage

Run either:

* `desktop_switcher.ahk` (In the windows-desktop-switcher git submodule)
* `desktop_switcher.exe` (contained in this directory, compiled by myself with my `user_config.ahk`. Note that I did not find an easy way to include the required DLL in the exe, so it needs to be run from a directory where the DLL is present. Run `install.ps1` to symlink it into this directory to make it work. The symlink cannot be committed to git because I found *no* way to create relative symlinks on Windows!!!)

Other than neo-vars, I have not found issues when running the un-compiled AHK script directly.
