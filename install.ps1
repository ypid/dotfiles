## Just copy the files in place. Seems nobody using windows ever heard about a dotfiles manager nor git* so this is what I ended up with.
## *git is now Microsoft default so forget about that last part :)

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

function link_path{
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

## I am using forward slashes. Get used to it Windows guys.
link_path "./windows/MS_Shell/" "$documents_path/WindowsPowerShell"
link_path "./nvim/init_min.vim" ~/_vimrc
link_path "./nvim/init.vim" ~/_vim
link_path "./windows/ConEmu/ConEmu.xml" "$env:APPDATA/ConEmu.xml"
link_path "./gitconfig" ~/.gitconfig

# mkdir -f "$env:APPDATA/VirtuaWin" > $null
# link_path "./windows/VirtuaWin/virtuawin.cfg" "$env:APPDATA/VirtuaWin/virtuawin.cfg"

mkdir -f "$env:APPDATA/obs-studio/basic/profiles/Untitled" > $null
## OBS Studio v20.1.3 can not handle these kinds of symlinks. It will overwrite them.
# link_path "./config/obs-studio/basic/profiles/Untitled/basic.ini" "$env:APPDATA/obs-studio/basic/profiles/Untitled/basic.ini"
cp--no-clobber "./config/obs-studio/basic/profiles/Untitled/basic.ini" "$env:APPDATA/obs-studio/basic/profiles/Untitled/basic.ini"

mkdir -f "$env:APPDATA/doublecmd/" > $null
## Doing this with only sed and output redirect has issues with file encoding as of 2018-11.
Copy-Item ./doublecmd/shortcuts.scf C:/Users/snero/AppData/Roaming/doublecmd/shortcuts.scf
sed --in-place --regexp-extended 's/Ctrl\+Shift\+7/Ctrl+Shift+8/;s#Ctrl\+Num/#Ctrl+Shift+7#;' "$env:APPDATA/doublecmd/shortcuts.scf"
cp--no-clobber "./doublecmd/sanitize_doublecmd_xml" "$env:APPDATA/doublecmd/doublecmd.xml"

mkdir -f "$env:APPDATA/Neo2/" > $null
link_path "./qNeo2/Neo2.ini" "$env:APPDATA/Neo2/Neo2.ini"

mkdir -f "$env:LOCALAPPDATA/VirtualStore/ProgramData/Chocolatey/lib/kitty/tools/Sessions" > $null
link_path "./windows/kitty/Sessions/Default%20Settings" "$env:LOCALAPPDATA/VirtualStore/ProgramData/Chocolatey/lib/kitty/tools/Sessions/Default%20Settings"

## FIXME
# link_path "./windows/kitty/kitty.ini" "$documents_path/portable/kitty/kitty.ini"

mkdir -f "$env:APPDATA/Everything/" > $null
## Everything as of v1.4.1.895 overwrites symbolic links.
# link_path "./windows/Everything/Everything.ini" "$env:APPDATA/Everything/Everything.ini"
cp--no-clobber "./windows/Everything/Everything.ini" "$env:APPDATA/Everything/Everything.ini"

cp--no-clobber "$documents_path/dotfiles/startup/startup.bat" "$env:APPDATA/Microsoft/Windows/Start Menu/Programs/Startup/startup.bat"

Install-Module -Name ZLocation
Install-Module -Name Pscx -Force -AllowClobber
# Install-Module -Name PSReadLine -Force
