# ===== WINFETCH CONFIGURATION =====

# $image = "~/winfetch.png"
# $noimage = $true

# Display image using ASCII characters
# $ascii = $true

# Set the version of Windows to derive the logo from.
# $logo = "Windows 11"

# Specify width for image/logo
$imgwidth = 25

# Specify minimum alpha value for image pixels to be visible
# $alphathreshold = 50

# Custom ASCII Art
# This should be an array of strings, with positive
# height and width equal to $imgwidth defined above.
# $CustomAscii = @(
#     "⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣦⠀ ⠀"
#     "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⣶⣾⣷⣶⣆⠸⣿⣿⡟⠀ ⠀"
#     "⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣷⡈⠻⠿⠟⠻⠿⢿⣷⣤⣤⣄⠀⠀ ⠀"
#     "⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀ ⠀"
#     "⠀⠀⠀⢀⣤⣤⡘⢿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⡇ ⠀"
#     "⠀⠀⠀⣿⣿⣿⡇⢸⣿⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⣉⣉⡁ ⠀"
#     "⠀⠀⠀⠈⠛⠛⢡⣾⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⡇ ⠀"
#     "⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⠟⠀ ⠀"
#     "⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⡿⢁⣴⣶⣦⣴⣶⣾⡿⠛⠛⠋⠀⠀ ⠀"
#     "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⠿⢿⡿⠿⠏⢰⣿⣿⣧⠀⠀ ⠀"
#     "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⠟⠀⠀ ⠀"
# )
$e = [char]27
$CustomAscii = @(

  "${e}[;37m  _      _______  _____  ____ _      ______"
  "${e}[;37m | | /| / /  _/ |/ / _ \/ __ \ | /| / / __/"
  "${e}[;37m | |/ |/ // //    / // / /_/ / |/ |/ /\ \  "
  "${e}[;37m |__/|__/___/_/|_/____/\____/|__/|__/___/"

)
# $CustomAscii = @(
#
# "${e}[;37m  __    _  ___  _ __   ___    ___  __    _  __, "
# "${e}[;37m ( /   /  ( /  ( /  ) ( / \  /  ()( /   /  (    "
# "${e}[;37m  / / /    /    /  /   /  / /   /  / / /    ``.  "
# "${e}[;37m (_/_/   _/_   /  (_ (/\_/ (___/  (_/_/   (___) "
#
# )

# Make the logo blink
# $blink = $true

# Display all built-in info segments.
# $all = $true

# Add a custom info line
# function info_custom_time {
#     return @{
#         title = "Time"
#         content = (Get-Date)
#     }
# }

function info_betterDashes {
    $length = [System.Environment]::UserName.Length + $env:COMPUTERNAME.Length + 1
    return @{
        title   = ""
        content = "─" * $length
    }
}

function info_above {
    return @{
        title   = ""
        content = " ╭" + "─" * 13 + "╮"
    }
}

function info_middle {
    return @{
        title   = ""
        content = " ├" + "─" * 13 + "┤"
    }
}

function info_below {
    return @{
        title   = ""
        content = " ╰" + "─" * 13 + "╯"
    }
}

function info_dotsBar {
    return @(
        @{
            icon    = "󰏘  "
            title   = "Colors"
            content = ('{0}[31m{1}{0}[32m{2}{0}[33m{3}{0}[34m{4}{0}[35m{5}{0}[36m{6}{0}[37m{7}{0}[30m{8}') -f $e, '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  '
        }
    )
}



# Configure which disks are shown
# $ShowDisks = @("C:", "D:")
# Show all available disks
# $ShowDisks = @("*")

# Configure which package managers are shown
# disabling unused ones will improve speed
# $ShowPkgs = @("winget", "scoop", "choco")

# Use the following option to specify custom package managers.
# Create a function with that name as suffix, and which returns
# the number of packages. Two examples are shown here:
# $CustomPkgs = @("cargo", "just-install")
# function info_pkg_cargo {
#     return (cargo install --list | Where-Object {$_ -like "*:" }).Length
# }
# function info_pkg_just-install {
#     return (just-install list).Length
# }

# Configure how to show info for levels
# Default is for text only.
# 'bar' is for bar only.
# 'textbar' is for text + bar.
# 'bartext' is for bar + text.
# $cpustyle = 'bar'
# $memorystyle = 'textbar'
# $diskstyle = 'bartext'
# $batterystyle = 'bartext'


# Remove the '#' from any of the lines in
# the following to **enable** their output.

@(
    # "title"
    # "dashes"
    # "betterDashes"
    "blank"
    "above"
    "os"
    "computer"
    # "kernel"
    # "motherboard"
    # "custom_time"  # use custom info line
    # "uptime"
    # "ps_pkgs"  # takes some time
    "pkgs"
    "pwsh"
    # "resolution"
    "terminal"
    # "theme"
    "cpu"
    "gpu"
    # "cpu_usage"
    "memory"
    # "disk"
    # "battery"
    # "locale"
    # "weather"
    # "local_ip"
    # "public_ip"
    # "blank"
    # "colorbar"
    "middle"
    "dotsBar"
    "below"
)
