###
# WINDOWS ONLY: Support for using "/" as the path separator in tab completion and with Convert-Path, Join-Path.
# See https://github.com/PowerShell/PowerShell/issues/10509
###
if ($env:OS -eq 'Windows_NT') {
  # On Windows only.

  # Set the preference variable to use "/" by default.
  # IMPORTANT: To limit this to INTERACTIVE calls (calls in the global scope),
  #            i.e. to not affect (non-dot-sourced) scripts and functions,
  #            the variable is made PRIVATE.
  $private:PSUseSlash = $true

  # TAB COMPLETION:
  # Modified TabExpansion2 function that for provider items and containers (file and directory paths)
  # replaces `\` with `/` on Windows.
  # CAVEAT:
  #  The (only) LIMITATION is that when a *directory* path is completed, PowerShell appends a "\",
  #  which is outside the control of this function and would require PowerShell itself to respect
  #  the $PSUseSlash preference variable.
  function TabExpansion2 {

    <# Options include:
       RelativeFilePaths - [bool]
           Always resolve file paths using Resolve-Path -Relative.
           The default is to use some heuristics to guess if relative or absolute is better.

     To customize your own custom options, pass a hashtable to CompleteInput, e.g.
           return [System.Management.Automation.CommandCompletion]::CompleteInput($inputScript, $cursorColumn,
               @{ RelativeFilePaths=$false }
  #>

    [CmdletBinding(DefaultParameterSetName = 'ScriptInputSet')]
    Param(
      [Parameter(ParameterSetName = 'ScriptInputSet', Mandatory = $true, Position = 0)]
      [string] $inputScript,

      [Parameter(ParameterSetName = 'ScriptInputSet', Position = 1)]
      [int] $cursorColumn = $inputScript.Length,

      [Parameter(ParameterSetName = 'AstInputSet', Mandatory = $true, Position = 0)]
      [System.Management.Automation.Language.Ast] $ast,

      [Parameter(ParameterSetName = 'AstInputSet', Mandatory = $true, Position = 1)]
      [System.Management.Automation.Language.Token[]] $tokens,

      [Parameter(ParameterSetName = 'AstInputSet', Mandatory = $true, Position = 2)]
      [System.Management.Automation.Language.IScriptPosition] $positionOfCursor,

      [Parameter(ParameterSetName = 'ScriptInputSet', Position = 2)]
      [Parameter(ParameterSetName = 'AstInputSet', Position = 3)]
      [Hashtable] $options = $null
    )

    End {
      $completions = if ($psCmdlet.ParameterSetName -eq 'ScriptInputSet') {
        [System.Management.Automation.CommandCompletion]::CompleteInput(
          <#inputScript#>  $inputScript,
          <#cursorColumn#> $cursorColumn,
          <#options#>      $options)
      }
      else {
        [System.Management.Automation.CommandCompletion]::CompleteInput(
          <#ast#>              $ast,
          <#tokens#>           $tokens,
          <#positionOfCursor#> $positionOfCursor,
          <#options#>          $options)
      }

      # If requested, replace "\" with "/" in file-system path completions.
      if (Get-Variable -ea Ignore -Scope 1 -ValueOnly PSUseSlash) {
        for ($i = 0; $i -lt $completions.CompletionMatches.Count; ++$i) {
          $cm = $completions.CompletionMatches[$i]
          if ($cm.ResultType -notin 'ProviderItem', 'ProviderContainer') { continue } # Not a file-system path?
          # Recrate the completion with "\" replaced with "/".
          $completions.CompletionMatches[$i] = [System.Management.Automation.CompletionResult]::new(
            $cm.CompletionText.Replace('\', '/'),
            $cm.ListItemText,
            $cm.ResultType,
            $cm.ToolTip.Replace('\', '/')
          )
        }
      }

      # Output the potentially modified completions.
      $completions
    }

  }

  # Wrapper function for Convert-Path that adds a -UseSlash (-sl) switch to request
  # /-separated output. 
  # This switch is implied if $PSUseSlash is available in the caller's scope and set to $true (is truthy).
  function Convert-Path {
    <#
      .FORWARDHELPTARGETNAME Microsoft.PowerShell.Management\Convert-Path
  #>
    [CmdletBinding(DefaultParameterSetName = 'Path', HelpUri = 'https://go.microsoft.com/fwlink/?LinkID=2096588', RemotingCapability = 'None')]
    param(
      [Parameter(ParameterSetName = 'Path', Mandatory = $true, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [string[]]
      ${Path},
  
      [Parameter(ParameterSetName = 'LiteralPath', Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('PSPath', 'LP')]
      [string[]]
      ${LiteralPath},
  
      [Alias('sl')] [switch] $UseSlash # custom switch
    )
  
    begin {
  
      if ($PSBoundParameters.ContainsKey('UseSlash')) { 
        $null = $PSBoundParameters.Remove('UseSlash') 
      }
      elseif ((Get-Variable -ea Ignore -ValueOnly PSUseSlash) -or (Get-Variable -ea Ignore -Scope 1 -ValueOnly PSUseSlash)) {
        $UseSlash = $true
      }
      if ($env:OS -ne 'Windows_NT') { $UseSlash = $false } # Ignore on Unix.
  
      $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Microsoft.PowerShell.Management\Convert-Path', 'Cmdlet')
      $scriptCmd = if ($UseSlash) {
        { & $wrappedCmd @PSBoundParameters | ForEach-Object { $_.Replace('\', '/') } }
      }
      else {
        { & $wrappedCmd @PSBoundParameters }
      }
  
      $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
      $steppablePipeline.Begin($PSCmdlet)
    }
  
    process {
      try {
        $null = $steppablePipeline.Process($_)
      }
      catch {
        $PSCmdlet.ThrowTerminatingError($_)
      }
    }
  
    end { try { $steppablePipeline.End() } catch { $PSCmdlet.ThrowTerminatingError($_) } }
  
  }
  
  
  # Ditto for Join-Path
  function Join-Path {
    <#
      .FORWARDHELPTARGETNAME Microsoft.PowerShell.Management\Join-Path
  #>  
    [CmdletBinding(HelpUri = 'https://go.microsoft.com/fwlink/?LinkID=2096811')]
    param(
      [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('PSPath')]
      [string[]]
      ${Path},
    
      [Parameter(Mandatory = $true, Position = 1, ValueFromPipelineByPropertyName = $true)]
      [AllowEmptyString()]
      [AllowNull()]
      [string]
      ${ChildPath},
    
      [Parameter(Position = 2, ValueFromPipelineByPropertyName = $true, ValueFromRemainingArguments = $true)]
      [AllowNull()]
      [AllowEmptyString()]
      [AllowEmptyCollection()]
      [string[]]
      ${AdditionalChildPath},
    
      [switch]
      ${Resolve},
    
      [Parameter(ValueFromPipelineByPropertyName = $true)]
      [pscredential]
      [System.Management.Automation.CredentialAttribute()]
      ${Credential},
    
      [Alias('sl')] [switch] $UseSlash # custom switch
    )
      
    begin {
      try {
        if ($PSBoundParameters.ContainsKey('UseSlash')) { 
          $null = $PSBoundParameters.Remove('UseSlash') 
        }
        elseif ((Get-Variable -ea Ignore -ValueOnly PSUseSlash) -or (Get-Variable -ea Ignore -Scope 1 -ValueOnly PSUseSlash)) {
          $UseSlash = $true
        }
        if ($env:OS -ne 'Windows_NT') { $UseSlash = $false } # Ignore on Unix.
    
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Microsoft.PowerShell.Management\Join-Path', 'Cmdlet')
        $scriptCmd = if ($UseSlash) {
          { & $wrappedCmd @PSBoundParameters | ForEach-Object { $_.Replace('\', '/') } }
        }
        else {
          { & $wrappedCmd @PSBoundParameters }
        }      
    
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
      }
      catch {
        $PSCmdlet.ThrowTerminatingError($_)
      }
    }
    
    process {
      try {
        $null = $steppablePipeline.Process($_)
      }
      catch {
        $PSCmdlet.ThrowTerminatingError($_)
      }
    }
    
    end { try { $steppablePipeline.End() } catch { $PSCmdlet.ThrowTerminatingError($_) } }
    
  }
  

  # Ditto for Split-Path
  function Split-Path {
    <#
      .FORWARDHELPTARGETNAME Microsoft.PowerShell.Management\Split-Path
  #>    
    [CmdletBinding(DefaultParameterSetName = 'ParentSet', SupportsTransactions = $true, HelpUri = 'https://go.microsoft.com/fwlink/?LinkID=113404')]
    param(
      [Parameter(ParameterSetName = 'NoQualifierSet', Mandatory = $true, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Parameter(ParameterSetName = 'LeafSet', Mandatory = $true, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Parameter(ParameterSetName = 'QualifierSet', Mandatory = $true, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Parameter(ParameterSetName = 'ParentSet', Mandatory = $true, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Parameter(ParameterSetName = 'IsAbsoluteSet', Mandatory = $true, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [string[]]
      ${Path},
  
      [Parameter(ParameterSetName = 'LiteralPathSet', Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('PSPath')]
      [string[]]
      ${LiteralPath},
  
      [Parameter(ParameterSetName = 'QualifierSet', Position = 1, ValueFromPipelineByPropertyName = $true)]
      [switch]
      ${Qualifier},
  
      [Parameter(ParameterSetName = 'NoQualifierSet', ValueFromPipelineByPropertyName = $true)]
      [switch]
      ${NoQualifier},
  
      [Parameter(ParameterSetName = 'ParentSet', ValueFromPipelineByPropertyName = $true)]
      [switch]
      ${Parent},
  
      [Parameter(ParameterSetName = 'LeafSet', ValueFromPipelineByPropertyName = $true)]
      [switch]
      ${Leaf},
  
      [switch]
      ${Resolve},
  
      [Parameter(ParameterSetName = 'IsAbsoluteSet')]
      [switch]
      ${IsAbsolute},
  
      [Parameter(ValueFromPipelineByPropertyName = $true)]
      [pscredential]
      [System.Management.Automation.CredentialAttribute()]
      ${Credential},
    
      [Alias('sl')] [switch] $UseSlash # custom switch
    )

    begin {
      try {
        if ($PSBoundParameters.ContainsKey('UseSlash')) { 
          $null = $PSBoundParameters.Remove('UseSlash') 
        }
        elseif ((Get-Variable -ea Ignore -ValueOnly PSUseSlash) -or (Get-Variable -ea Ignore -Scope 1 -ValueOnly PSUseSlash)) {
          $UseSlash = $true
        }
        if ($env:OS -ne 'Windows_NT') { $UseSlash = $false } # Ignore on Unix.
    
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Microsoft.PowerShell.Management\Split-Path', 'Cmdlet')
        $scriptCmd = if ($UseSlash -and -not $IsAbsolute) {
          # note: -IsAbsolute returns a [bool]
          { & $wrappedCmd @PSBoundParameters | ForEach-Object { $_.Replace('\', '/') } }
        }
        else {
          { & $wrappedCmd @PSBoundParameters }
        }      
    
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
      }
      catch {
        $PSCmdlet.ThrowTerminatingError($_)
      }
    }
    
    process {
      try {
        $null = $steppablePipeline.Process($_)
      }
      catch {
        $PSCmdlet.ThrowTerminatingError($_)
      }
    }
    
    end { try { $steppablePipeline.End() } catch { $PSCmdlet.ThrowTerminatingError($_) } }
    
  }

} # end: use of "/" on Windows.
