# Blake's NvChad Configuration

## Prerequisites

**Mac:**
```bash
brew install neovim git ripgrep lazygit fzf node llvm && npm install -g @biomejs/biome
```

**Linux:**
```bash
sudo apt update && sudo apt install -y neovim git ripgrep lazygit fzf nodejs npm clangd build-essential gdb && npm install -g @biomejs/biome
```

**Windows:**
```powershell
winget install Neovim.Neovim Git.Git BurntSushi.ripgrep.MSVC fzf OpenJS.NodeJS
npm install -g @biomejs/biome
```

**Nerd Font:**
Download https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip, unzip, double-click `.ttf` files to install, then set as terminal font.

## Installation

**Mac/Linux:**
```bash
mv ~/.config/nvim ~/.config/nvim.backup
git clone https://github.com/blakeallard/nvim-config ~/.config/nvim
nvim
```

**Windows:**
```powershell
mv ~\AppData\Local\nvim ~\AppData\Local\nvim.backup
git clone https://github.com/blakeallard/nvim-config ~\AppData\Local\nvim
nvim
```

## Credits

[NvChad](https://github.com/NvChad/NvChad) | [LazyVim](https://github.com/LazyVim/starter)
