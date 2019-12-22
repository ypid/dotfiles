## This script just links (or as fall back, copies) the files in place. Seems nobody using windows ever heard about a dotfiles manager nor git* so this is what I ended up with.
## *git is now even Microsoft default so forget about that last part :)

function cp--no-clobber{
    Param(
        [parameter(Mandatory=$true)][String]$source,
        [parameter(Mandatory=$true)][String]$dest
    )

    if ((test-path $dest) -bxor 1) {
        echo "cp $source $dest"
        cp $source $dest
    }
}

function ln-s{
    Param(
        [parameter(Mandatory=$true)][String]$source,
        [parameter(Mandatory=$true)][String]$dest
    )

    if ((Test-Path -Type Container "$dest") -bxor 1) {

        echo "Deleting: $dest"
        Remove-Item "$dest" -ErrorAction Ignore
        if ((test-path $dest) -bxor 1) {
            echo "Creating link: $dest -> $source"
            # new-hardlink "$dest" "$source"
            new-item -Path "$dest" -ItemType SymbolicLink -Value "$source" | Out-Null
        }
    } else {
        echo "Skipping existing directory: $dest"
    }
}

$documents_path = [environment]::getfolderpath("mydocuments")

## Patch submodules.
ln-s "./windows/windows-desktop-switcher-my/user_config.ahk" "./windows/windows-desktop-switcher/user_config.ahk"

## I cannot commit the result of this command to git because I found *no* way to create relative symlinks on Windows!!!
ln-s "./windows/windows-desktop-switcher/VirtualDesktopAccessor.dll" "./windows/windows-desktop-switcher-my/VirtualDesktopAccessor.dll"

## I am using forward slashes. Get used to it Windows guys.
ln-s "./windows/MS_Shell/" "$documents_path/WindowsPowerShell"
ln-s "./nvim/init_min.vim" ~/_vimrc
ln-s "./nvim/init.vim" ~/_vim
ln-s "./windows/ConEmu/ConEmu.xml" "$env:APPDATA/ConEmu.xml"
ln-s "./gitconfig" ~/.gitconfig

# mkdir -f "$env:APPDATA/VirtuaWin" > $null
# ln-s "./windows/VirtuaWin/virtuawin.cfg" "$env:APPDATA/VirtuaWin/virtuawin.cfg"

mkdir -f "$env:APPDATA/obs-studio/basic/profiles/Untitled" > $null
## OBS Studio v20.1.3 can not handle these kinds of symlinks. It will overwrite them.
# ln-s "./config/obs-studio/basic/profiles/Untitled/basic.ini" "$env:APPDATA/obs-studio/basic/profiles/Untitled/basic.ini"
cp--no-clobber "./config/obs-studio/basic/profiles/Untitled/basic.ini" "$env:APPDATA/obs-studio/basic/profiles/Untitled/basic.ini"

mkdir -f "$env:APPDATA/doublecmd/" > $null
## Doing this with only sed and output redirect has issues with file encoding as of 2018-11.
Copy-Item ./doublecmd/shortcuts.scf C:/Users/snero/AppData/Roaming/doublecmd/shortcuts.scf
sed --in-place --regexp-extended 's/Ctrl\+Shift\+7/Ctrl+Shift+8/;s#Ctrl\+Num/#Ctrl+Shift+7#;' "$env:APPDATA/doublecmd/shortcuts.scf"
cp--no-clobber "./doublecmd/sanitize_doublecmd_xml" "$env:APPDATA/doublecmd/doublecmd.xml"

mkdir -f "$env:APPDATA/Neo2/" > $null
ln-s "./qNeo2/Neo2.ini" "$env:APPDATA/Neo2/Neo2.ini"

mkdir -f "$env:LOCALAPPDATA/VirtualStore/ProgramData/Chocolatey/lib/kitty/tools/Sessions" > $null
ln-s "./windows/kitty/Sessions/Default%20Settings" "$env:LOCALAPPDATA/VirtualStore/ProgramData/Chocolatey/lib/kitty/tools/Sessions/Default%20Settings"

## FIXME
# ln-s "./windows/kitty/kitty.ini" "$documents_path/portable/kitty/kitty.ini"

mkdir -f "$env:APPDATA/Everything/" > $null
## Everything as of v1.4.1.895 overwrites symbolic links.
# ln-s "./windows/Everything/Everything.ini" "$env:APPDATA/Everything/Everything.ini"
cp--no-clobber "./windows/Everything/Everything.ini" "$env:APPDATA/Everything/Everything.ini"

cp--no-clobber "$documents_path/dotfiles/startup/startup.bat" "$env:APPDATA/Microsoft/Windows/Start Menu/Programs/Startup/startup.bat"

Install-Module -Name ZLocation
Install-Module -Name Pscx -Force -AllowClobber
# Install-Module -Name PSReadLine -Force
