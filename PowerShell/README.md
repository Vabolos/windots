
# My PowerShell Dotfiles

This repository contains my PowerShell configuration files and setup. To replicate my setup, you'll need to install a few dependencies. Below are the packages I use, with links to their official websites for installation.

## Dependencies

### 1. **PowerShell**
- **Description:** This configuration is designed for PowerShell 7+, so make sure you're using the latest version of PowerShell.
- **Installation:** [PowerShell Installation Guide](https://aka.ms/install-powershell)

### 2. **Oh My Posh**
- **Description:** Oh My Posh provides custom prompt themes for PowerShell. I use the `clean-detailed` theme.
- **Installation:** [Oh My Posh Documentation](https://ohmyposh.dev/docs/installation)

### 3. **winfetch**
- **Description:** Winfetch is a command-line system information tool for Windows, similar to `neofetch`.
- **Installation:** [Winfetch GitHub Repo](https://github.com/kiedtl/winfetch)

### 4. **onefetch**
- **Description:** Onefetch displays Git repository information in the terminal.
- **Installation:** [Onefetch GitHub Repo](https://github.com/o2sh/onefetch)

### 5. **Neovim**
- **Description:** I use Neovim as my default text editor, aliased to `vim`.
- **Installation:** [Neovim Installation Guide](https://neovim.io)

### 6. **git**
- **Description:** Git is a version control system used to manage my repositories.
- **Installation:** [Git Official Website](https://git-scm.com/)

### 7. **Terminal Icons**
- **Description:** Adds file and folder icons to PowerShell.
- **Installation:** Install via PowerShell with the following command:
  ```powershell
  Install-Module -Name Terminal-Icons -Repository PSGallery
  ```

### 8. **tree (Optional)**
- **Description:** `tree` is a command-line utility that displays the directory structure in a tree-like format.
- **Installation:** [tree for Windows](https://gnuwin32.sourceforge.net/packages/tree.htm)

## PowerShell Profile

Here’s a brief overview of my PowerShell profile setup:
- Aliases for common commands (`tree`, `ls`, `git`, `vim`).
- Auto-start commands for clearing the screen and displaying system info with `winfetch`.
- Oh My Posh for prompt customization.
- Auto-run `onefetch` when navigating to GitHub repositories.

Feel free to explore the configuration files and customize them for your own use!
