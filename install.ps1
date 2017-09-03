## Just copy the files in place. Seems nobody using windows ever heard about a dotfiles manager so this is what I ended up with.

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

function enable_file{
    Param(
        [parameter(Mandatory=$true)][String]$source,
        [parameter(Mandatory=$true)][String]$dest
    )

    # rm "$dest"
    if ((test-path $dest) -bxor 1) {
        echo new-hardlink "$dest" "$source"
        new-hardlink "$dest" "$source"
    }
}

enable_file ".\vimrc.min" ~/_vimrc
enable_file ".\windows\ConEmu\ConEmu.xml" "$env:APPDATA/ConEmu.xml"
enable_file "gitconfig" ~/.gitconfig
