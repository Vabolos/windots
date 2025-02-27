# Error Handling
$ErrorActionPreference = 'SilentlyContinue'

# Aliases
Set-Alias tt tree
Set-Alias ll ls
Set-Alias g git
Set-Alias vim nvim
Set-Alias refresh ". $PROFILE"

# Git Shortcuts
function gs { git status }
function ga { git add . }
function gp { git push }
function gpl { git pull }
function gl { git log --oneline --graph --decorate --all }
function gd { git diff }

function gc { param($m) git commit -m "$m" }

function gcl {
    param([string]$repoUrl)
    git clone $repoUrl
}

function gcom {
    param([string]$message)
    git add .
    git commit -m "$message"
}

function lazyg {
    param([string]$message)
    git add .
    git commit -m "$message"
    git push
}

# Function: Create directory and cd into it
function mkcd {
    param([string]$dir)
    if (-not $dir) { Write-Host "Usage: mkcd <directory-name>"; return }
    mkdir $dir -Force | Out-Null
    cd $dir
}

# Auto-start Fetch Utility (Detects installed version)
cls
if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
    fastfetch
} elseif (Get-Command winfetch -ErrorAction SilentlyContinue) {
    winfetch
}

# Oh My Posh Prompt
oh-my-posh init pwsh --config 'C:\Users\lucfr\AppData\Local\Programs\oh-my-posh\themes\zen.toml' | Invoke-Expression

# Function: Find the path of a command
function whereis ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Enhanced PSReadLine Configuration
$PSReadLineOptions = @{
    EditMode = 'Windows'
    HistoryNoDuplicates = $true
    HistorySearchCursorMovesToEnd = $true
    Colors = @{
        Command = '#87CEEB'  
        Parameter = '#98FB98'  
        Operator = '#FFB6C1'  
        Variable = '#DDA0DD'  
        String = '#FFDAB9'  
        Number = '#B0E0E6'  
        Type = '#F0E68C'  
        Comment = '#D3D3D3'  
        Keyword = '#8367c7'  
        Error = '#FF6347'  
    }
    PredictionSource = 'History'
    PredictionViewStyle = 'ListView'
    BellStyle = 'None'
}
Set-PSReadLineOption @PSReadLineOptions

# Load Modules
Import-Module Terminal-Icons
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -PredictionViewStyle ListView

# Automatically run onefetch in GitHub directories
$lastDirIsRepo = $false
function Set-Location {
    param (
        [string]$path
    )

    # Normalize and handle "cd .."
    if (-not $path) { $path = '~' }
    if ($path -match "^\.\.($|\\)") { cls }

    # Change directory
    Microsoft.PowerShell.Management\Set-Location $path

    # Check for .git directory
    $currentDir = Get-Location
    $isRepo = Test-Path "$currentDir\.git"

    if ($isRepo -and -not $lastDirIsRepo) {
        cls
        onefetch
    }

    $lastDirIsRepo = $isRepo
}
