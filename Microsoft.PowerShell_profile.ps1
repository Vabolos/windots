#Suppress loading message
$ErrorActionPreference = 'SilentlyContinue'

# Aliases
Set-Alias tt tree
Set-Alias ll ls
Set-Alias g git
Set-Alias vim nvim

# Auto-start
cls
winfetch

# Prompt
# change the path to your own local user path
oh-my-posh init pwsh --config 'C:\Users\username\AppData\Local\Programs\oh-my-posh\themes\clean-detailed.omp.json' | Invoke-Expression

# Functions
function whereis ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Modules
Import-Module Terminal-Icons
# Special function for PSReadLine
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -PredictionViewStyle ListView
