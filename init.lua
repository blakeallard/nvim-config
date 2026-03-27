vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

require('snippets')

-- Mouse button tab navigation
vim.keymap.set('n', '<C-PageDown>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-PageUp>', ':bprevious<CR>', { noremap = true, silent = true })

-- DAP keybindings
vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = 'Start/Continue Debug' })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = 'Step Over' })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = 'Step Into' })
