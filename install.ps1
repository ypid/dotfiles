## This script just links (or as fall back, copies) the files in place. Seems nobody using windows ever heard about a dotfiles manager nor git* so this is what I ended up with.
## *git is now even Microsoft default so forget about that last part :)
## NOTE: I am switching to install-legacy-windows.conf.yaml

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


$documents_path = [environment]::getfolderpath("mydocuments")


mkdir -f "$env:APPDATA/doublecmd/" > $null
## Doing this with only sed and output redirect has issues with file encoding as of 2018-11.
# Still needed?
Copy-Item ./doublecmd/shortcuts.scf C:/Users/snero/AppData/Roaming/doublecmd/shortcuts.scf
sed --in-place --regexp-extended 's/Ctrl\+Shift\+7/Ctrl+Shift+8/;s#Ctrl\+Num/#Ctrl+Shift+7#;' "$env:APPDATA/doublecmd/shortcuts.scf"

cp--no-clobber "$documents_path/dotfiles/startup/startup.bat" "$env:APPDATA/Microsoft/Windows/Start Menu/Programs/Startup/startup.bat"

Install-Module -Name ZLocation
Install-Module -Name Pscx -Force -AllowClobber
# Install-Module -Name PSReadLine -Force
