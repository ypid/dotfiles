## Just copy the files in place. Seems nobody using windows ever heard about a dotfiles manager nor git so this is what I ended up with.

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

    # rm "$dest"
    if ((test-path $dest) -bxor 1) {
        echo new-hardlink "$dest" "$source"
        # new-hardlink "$dest" "$source"
        new-item -Path "$dest" -ItemType SymbolicLink -Value "$source"
    }
}

## I am using forward slashes. Get used to it Windows guys.
link_path "./windows/WindowsPowerShell" ~/Documents/WindowsPowerShell
link_path "./vimrc.min" ~/_vimrc
link_path "./windows/ConEmu/ConEmu.xml" "$env:APPDATA/ConEmu.xml"
link_path "./gitconfig" ~/.gitconfig
mkdir -f "$env:APPDATA/VirtuaWin" > $null
link_path "./windows/VirtuaWin/virtuawin.cfg" "$env:APPDATA/VirtuaWin/virtuawin.cfg"

mkdir -f "~/Documents/portable/kitty/Sessions/" > $null
link_path "./windows/kitty/Sessions/Default%20Settings" "~/Documents/portable/kitty/Sessions/Default%20Settings"
link_path "./windows/kitty/kitty.ini" "~/Documents/portable/kitty/kitty.ini"

link_path "~/Documents/dotfiles/startup/startup.bat" "$env:APPDATA/Microsoft/Windows/Start Menu/Programs/Startup/startup.bat"
