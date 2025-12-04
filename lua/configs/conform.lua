local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
    c = { "clang-format" },
  },
  
  formatters = {
    ["clang-format"] = {
      prepend_args = { "--style={BasedOnStyle: LLVM, BreakBeforeBraces: Allman, IndentWidth: 4}" },
    },
  },
  
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
