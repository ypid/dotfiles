Set-StrictMode -Version latest

Function Get-CleanPath {
    [CmdletBinding()]

    Param(
        [Parameter(Position=0, ValueFromPipeline)
       ][string] $Path
    )

    [string] $sanitized_path = [System.IO.DirectoryInfo]::new($Path).FullName
    $sanitized_path = $sanitized_path.TrimEnd("/", "\")
    $sanitized_path = $sanitized_path -replace "\\", "/"
    return $sanitized_path
}

Function Add-Path {
    [CmdletBinding()]

    Param(
        [parameter(Mandatory)][string] $Path,
        [switch] $Prepend
    )

    if (Test-Path -PathType Container -Path $Path) {
        ## An OrderedSet would have been preferred.
        $env_paths = New-Object -TypeName System.Collections.Specialized.OrderedDictionary

        [string[]] $env_path_list = @()
        if ($Prepend) { $env_path_list += $Path }
        $env_path_list += $env:Path -split ';'
        if (!$Prepend) { $env_path_list += $Path }

        foreach ($env_single_path in $env_path_list) {
            try {
                $env_paths.Add($(Get-CleanPath $env_single_path), $true) | Out-Null
            } catch {}
        }

        $env:Path = $($env_paths.Keys -join ";")
    }
}

Function Add-PathAtBegin {
    [CmdletBinding()]

    Param(
        [parameter(Mandatory)][string] $Path
    )

    Add-Path $Path -Prepend
}

Function Add-PathAtEnd {
    [CmdletBinding()]

    Param(
        [parameter(Mandatory)][string] $Path
    )

    Add-Path $Path
}

Function Set-LocationUnix {
    ## Not using named parameters because that causes parameter tab completion
    ## to appear when "-" is typed which inconvenient here.
    # Param(
    #     [string] $Path
    # )

    [string] $Path = [NullString]::Value

    if ($args.Count -gt 0) {
        $Path = $args[0]
    }

    if ($Path -eq $null) {
        $new_pwd = '~'
    } elseif ($Path -eq '-') {
        $new_pwd = $env:OLDPWD
    } else {
        $new_pwd = $Path
    }

    if ($new_pwd) {
        [string]$env:OLDPWD = "$(Get-Location)"
        Set-Location $new_pwd
    }
}

Function Set-LocationUp {
    [CmdletBinding()]

    Param(
        [int] $Count = 1
    )

    [string] $path = "./"

    for ($i = 0; $i -lt $Count; $i++) {
        $path = $path + '../'
    }
    Set-Location $path
}

## Create a new directory and enter it
Function Set-LocationMkDir {
    [CmdletBinding()]

    Param(
        [parameter(Mandatory)][string] $Path
    )

    New-Item $Path -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
    Set-Location $Path
}


Function Set-AliasUnix {

    if ($args.Count -gt 0) {
        ## Not working yet.
        Set-Alias @args
    } else {
        Get-Alias
    }
}

Function Remove-Alias {
    [CmdletBinding()]

    Param(
        [parameter(Mandatory)][string]$Alias
    )

    Remove-Item alias:$Alias
}

Function Get-HistorySearch {
    [CmdletBinding()]

    Param(
        [Parameter(Position=0, ValueFromPipeline)]
        [string] $Pattern = '.'
    )

    Get-History | ? { $_.CommandLine -match $Pattern }
}

## More human readable than pscx?
## Source: http://powershellblogger.com/2016/01/get-last-computer-boot-time-or-up-time-with-powershell/
Function Get-Uptime {
    Param ( [string] $ComputerName = $env:COMPUTERNAME )
    $os = Get-WmiObject win32_operatingsystem -ComputerName $ComputerName -ErrorAction SilentlyContinue
    if ($os.LastBootUpTime) {
        $uptime = (Get-Date) - $os.ConvertToDateTime($os.LastBootUpTime)
        Write-Output ("Last boot: " + $(get-date -date $os.LastBootUpTime -format o) )
        Write-Output ("Uptime:    " + $uptime.Days + " Days " + $uptime.Hours + " Hours " + $uptime.Minutes + " Minutes" )
    } else {
        Write-Warning "Unable to connect to $computername"
    }
}

# System Update - Update RubyGems, NPM, and their installed packages
Function Get-SystemUpdate {
    # [CmdletBinding()]

    Install-WindowsUpdate -IgnoreUserInput -IgnoreReboot -AcceptAll
    Update-Module
    Update-Help -Force
    scoop update
    gem update --system
    gem update
    npm install npm -g
    npm update -g
}

# Reload the Shell
Function Restart-Powershell {
    [CmdletBinding()]

    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
    $newProcess.Arguments = "-nologo";
    [System.Diagnostics.Process]::Start($newProcess);
    exit
}

# Sound Volume
Function Get-SoundVolume { [Audio]::Volume }
Function Set-SoundVolume([Int32] $volume) { [Audio]::Volume = ($volume / 100)}
Function Set-SoundMute { [Audio]::Mute = $true }
Function Set-SoundUnmute { [Audio]::Mute = $false }

# Determine size of a file or total size of a directory
Function Get-DiskUsage([string] $path=(Get-Location).Path) {
    Convert-ToDiskSize `
        ( `
            Get-ChildItem .\ -recurse -ErrorAction SilentlyContinue `
            | Measure-Object -property length -sum -ErrorAction SilentlyContinue
        ).Sum `
        1
}

### Environment functions
### ----------------------------

# Reload the $env object from the registry
Function Read-Environment {
    $locations = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
                 'HKCU:\Environment'

    $locations | ForEach-Object {
        $k = Get-Item $_
        $k.GetValueNames() | ForEach-Object {
            $name  = $_
            $value = $k.GetValue($_)
            Set-Item -Path Env:\$name -Value $value
        }
    }

    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# Set a permanent Environment variable, and reload it into $env
Function Set-Environment {
    [CmdletBinding()]

    Param(
        [Alias("Key")]
        [parameter(Mandatory)][string] $Name,
        [parameter(Mandatory)][string] $Value
    )

    Set-ItemProperty "HKCU:\Environment" $Name $Value
    # Manually setting Registry entry. SetEnvironmentVariable is too slow because of blocking HWND_BROADCAST
    #[System.Environment]::SetEnvironmentVariable("$variable", "$value","User")
    Invoke-Expression "`$env:${Name} = `"$Value`""
}


### Utilities
### ----------------------------

# Convert a number to a disk size (12.4K or 5M)
Function Convert-ToDiskSize {
    param ( $bytes, $precision='0' )
    foreach ($size in ("B","K","M","G","T")) {
        if (($bytes -lt 1000) -or ($size -eq "T")){
            $bytes = ($bytes).tostring("F0" + "$precision")
            return "${bytes}${size}"
        }
        else { $bytes /= 1KB }
    }
}
