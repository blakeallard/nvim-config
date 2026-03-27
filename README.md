# Blake's NvChad Configuration

Fully-configured Neovim setup with C++ development, debugging, and modern tooling.

## Prerequisites

**Mac:**
```bash
brew install neovim git ripgrep lazygit fzf node llvm && npm install -g @biomejs/biome
```

**Linux:**
```bash
sudo apt update && sudo apt install -y neovim git ripgrep lazygit fzf nodejs npm clangd build-essential gdb && npm install -g @biomejs/biome
```

**Nerd Font:** Download from https://www.nerdfonts.com/ (FiraCode, JetBrainsMono, or Hack)

## Installation
```bash
mv ~/.config/nvim ~/.config/nvim.backup
git clone https://github.com/blakeallard/nvim-config ~/.config/nvim
nvim
```

Wait for plugins to install, then restart.

## Reference Materials

Check `docs/` folder for guides on plugins, snippets, terminal tools, and tmux.

## Features

C++ LSP and debugging, LazyGit integration, fzf search, 15+ themes, Treesitter, ToggleTerm, TypeScript/React support.

## Credits

[NvChad](https://github.com/NvChad/NvChad) | [LazyVim starter](https://github.com/LazyVim/starter)
