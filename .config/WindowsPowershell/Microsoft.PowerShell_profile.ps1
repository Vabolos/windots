# Existing content
$ErrorActionPreference = 'SilentlyContinue'

# Aliases
Set-Alias tt tree
Set-Alias ll ls
Set-Alias g git
Set-Alias vim nvim

# Auto-start
cls
## choose between winfetch and fastfetch (uncomment one!)
#winfetch
fastfetch

# Prompt
# choose between clean-detailed and zen (uncomment one!)
#oh-my-posh init pwsh --config 'C:\Users\lucfr\AppData\Local\Programs\oh-my-posh\themes\clean-detailed.omp.json' | Invoke-Expression
oh-my-posh init pwsh --config 'C:\Users\lucfr\AppData\Local\Programs\oh-my-posh\themes\zen.toml' | Invoke-Expression

# Functions
function whereis ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Modules
Import-Module Terminal-Icons
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -PredictionViewStyle ListView

============================================================
# Automatically run onefetch in GitHub directories

# Track if the last directory was a Git repo
$lastDirIsRepo = $false

# Override Set-Location (cd) function
function Set-Location {
    param (
        [string]$path
    )

    # Normalize path and handle cases like "cd .." or "cd.."
    if ($path -match "^\.\.($|\\)") {
        # Clear the terminal when "cd .." is executed
        cls
    }

    # Call the original Set-Location (cd) function
    Microsoft.PowerShell.Management\Set-Location $path

    # Get the current directory path after changing
    $currentDir = Get-Location

    # Check if the current directory contains a .git folder
    if (Test-Path "$currentDir\.git") {
        # If inside a repo, run onefetch
        if (-not $lastDirIsRepo) {
            cls
            onefetch
        }
        $lastDirIsRepo = $true
    }
    else {
        # If leaving a repo or not in a repo, clear the screen
        if ($lastDirIsRepo) {
            cls
        }
        $lastDirIsRepo = $false
    }
}