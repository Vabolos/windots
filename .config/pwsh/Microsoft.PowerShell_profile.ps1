# Existing content
$ErrorActionPreference = 'SilentlyContinue'

# Aliases
Set-Alias tt tree
Set-Alias ll ls
Set-Alias g git
Set-Alias vim nvim

# Git Shortcuts
function gs { git status }

function ga { git add . }

function gc { param($m) git commit -m "$m" }

function gp { git push }

# function g { __zoxide_z github }

function gcl { git clone "$args" }

function gcom {
    git add .
    git commit -m "$args"
}
function lazyg {
    git add .
    git commit -m "$args"
    git push
}

# Auto-start
## choose between winfetch and fastfetch (uncomment one!)
#cls;winfetch
cls;fastfetch

# Prompt
#oh-my-posh init pwsh --config 'C:\Users\lucfr\AppData\Local\Programs\oh-my-posh\themes\clean-detailed.omp.json' | Invoke-Expression
oh-my-posh init pwsh --config 'C:\Users\lucfr\AppData\Local\Programs\oh-my-posh\themes\zen.toml' | Invoke-Expression

# Functions
function whereis ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Modules
# Enhanced PSReadLine Configuration
$PSReadLineOptions = @{
    EditMode = 'Windows'
    HistoryNoDuplicates = $true
    HistorySearchCursorMovesToEnd = $true
    Colors = @{
        Command = '#87CEEB'  # SkyBlue (pastel)
        Parameter = '#98FB98'  # PaleGreen (pastel)
        Operator = '#FFB6C1'  # LightPink (pastel)
        Variable = '#DDA0DD'  # Plum (pastel)
        String = '#FFDAB9'  # PeachPuff (pastel)
        Number = '#B0E0E6'  # PowderBlue (pastel)
        Type = '#F0E68C'  # Khaki (pastel)
        Comment = '#D3D3D3'  # LightGray (pastel)
        Keyword = '#8367c7'  # Violet (pastel)
        Error = '#FF6347'  # Tomato (keeping it close to red for visibility)
    }
    PredictionSource = 'History'
    PredictionViewStyle = 'ListView'
    BellStyle = 'None'
}
Set-PSReadLineOption @PSReadLineOptions

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