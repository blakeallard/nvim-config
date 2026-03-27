# Blake's NvChad Configuration

## Prerequisites

**Mac:**
```bash
# Install Homebrew first (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install tools
brew install neovim git ripgrep lazygit fzf node llvm tmux && npm install -g @biomejs/biome
```

**Linux:**
```bash
sudo apt update && sudo apt install -y neovim git ripgrep lazygit fzf nodejs npm clangd build-essential gdb tmux && npm install -g @biomejs/biome
```

**Windows (PowerShell as Admin):**
```powershell
# Install winget if needed (Windows 10 1809+)
# Already installed on Windows 11

# Install tools
winget install Neovim.Neovim Git.Git BurntSushi.ripgrep.MSVC fzf OpenJS.NodeJS
npm install -g @biomejs/biome
```

**Nerd Font:**
1. Download https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
2. Unzip and double-click `.ttf` files to install
3. Open terminal settings and change font to "JetBrainsMono Nerd Font"

## Installation

**Mac/Linux:**
```bash
# Backup existing config (ignore error if folder doesn't exist)
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null

# Clone and start
git clone https://github.com/blakeallard/nvim-config ~/.config/nvim
nvim
```

**Windows:**
```powershell
# Backup existing config (ignore error if folder doesn't exist)
mv ~\AppData\Local\nvim ~\AppData\Local\nvim.backup -ErrorAction SilentlyContinue

# Clone and start
git clone https://github.com/blakeallard/nvim-config ~\AppData\Local\nvim
nvim
```

Wait for plugins to install on first launch, then restart Neovim.

## Credits

[NvChad](https://github.com/NvChad/NvChad) | [LazyVim](https://github.com/LazyVim/starter)

## Extra Credit: Create Your Own Snippet

Edit `~/.config/nvim/lua/snippets.lua` and add:
```lua
s("trigger", {
  t("your text here")
}),
```

Restart Neovim. Type `trigger` + Tab to use it.

## Extra Credit: Create Your Own Snippet

Edit `~/.config/nvim/lua/snippets.lua` and add this inside the first `ls.add_snippets("cpp", {` block (after the `prep` snippet):
```lua
  -- Vector declaration
  s("vec", {
    t("vector<"), i(1, "int"), t("> "), i(2, "myVector"), t(";"),
  }),
```

Restart Neovim. Type `vec` + Tab in a C++ file to create: `vector<int> myVector;`
