# Existing content
# $ErrorActionPreference = 'SilentlyContinue'

# Aliases
Set-Alias tt tree
Set-Alias ll ls
Set-Alias g git
Set-Alias vim nvim

# Auto-start
cls
winfetch

# Prompt
oh-my-posh init pwsh --config 'C:\Users\lucfr\AppData\Local\Programs\oh-my-posh\themes\clean-detailed.omp.json' | Invoke-Expression

# Functions
function whereis ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Modules
Import-Module Terminal-Icons
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -PredictionViewStyle ListView

# Automatically run onefetch in GitHub directories
function Set-Location {
    param (
        [string]$path
    )

    # Call the original Set-Location (cd) function
    Microsoft.PowerShell.Management\Set-Location $path

    # Check if the directory contains a .git folder
    if (Test-Path "$path\.git") {
	cls
        onefetch
    }
}
