-- Clipboard configuration for macOS
vim.opt.clipboard = "unnamedplus"

-- Enable diagnostics for error highlighting
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

vim.keymap.set('v', '<C-c>', ':w! /tmp/copy<CR>', { silent = true })
