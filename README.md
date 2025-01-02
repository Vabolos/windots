# Dotfiles & Config Files

This repository contains my personal dotfiles and configuration files for various tools and environments. Feel free to explore, use, or adapt them for your own setup.

```md
📦 
├─ Discord
│  └─ system24 - Everforest Dark Medium.css
├─ LICENSE
├─ PowerShell
│  ├─ Microsoft.PowerShell_profile.ps1
│  ├─ README.md
│  └─ settings.json
├─ README.md
├─ Spicetify
│  ├─ Extensions
│  │  ├─ autoSkipExplicit.js
│  │  ├─ autoSkipVideo.js
│  │  ├─ bookmark.js
│  │  ├─ fullAppDisplay.js
│  │  ├─ keyboardShortcut.js
│  │  ├─ loopyLoop.js
│  │  ├─ popupLyrics.js
│  │  ├─ shuffle+.js
│  │  ├─ trashbin.js
│  │  └─ webnowplaying.js
│  └─ Theme
│     ├─ color.ini
│     └─ user.css
├─ Winfetch
│  ├─ Japanese Theme
│  │  ├─ config.ps1
│  │  └─ winfetch.ps1
│  ├─ Nitch Theme
│  │  ├─ config.ps1
│  │  └─ winfetch.ps1
│  ├─ Russian Theme
│  │  ├─ config.ps1
│  │  └─ winfetch.ps1
│  ├─ config.ps1
│  └─ winfetch.ps1
└─ Winhawk
   ├─ README.md
   ├─ StartmenuStyler.json
   └─ TaskbarStyler.json
```

## Contents

- **PSProfile** - Configuration for Bash shell
- **nvim** - Neovim editor settings (*soon*)
- **winfetch.ps1** - Winfetch cmd info
- **gitconfig** - Git settings and aliases (*soon*)
- **temninal settings** - config file for custom terminal

## Usage

To use any of these configurations, simply clone the repository and symlink the desired files to their respective locations. For example:

```bash
git clone https://github.com/yourusername/dotfiles.git
ln -sf ~/dotfiles/.bashrc ~/.bashrc
```
