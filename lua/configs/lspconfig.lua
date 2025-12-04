-- Load NVChad default LSP behavior
require("nvchad.configs.lspconfig").defaults()

-- Grab NVChad's LSP utilities
local nvlsp = require "nvchad.configs.lspconfig"

-- List of language servers to activate
local servers = { "html", "cssls", "clangd" }  -- Added clangd

-- 🧠 Modern Neovim 0.11+ LSP setup
-- Use vim.lsp.config instead of require('lspconfig')

-- Configure lua_ls separately
vim.lsp.config("lua_ls", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
          vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})

-- Configure all other servers
for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end
