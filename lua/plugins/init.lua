return {

  -- 1. Formatter (UPDATED with Biome)
  {
    "stevearc/conform.nvim",
    opts = function()
      local conform_opts = require "configs.conform"
      -- Merge with Biome formatters
      conform_opts.formatters_by_ft = vim.tbl_extend("force", conform_opts.formatters_by_ft or {}, {
        javascript = { "biome" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
        javascriptreact = { "biome" },
      })
      return conform_opts
    end,
  },

  -- 2. LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- 3. Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<leader>t]],
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
        },
      })
    end,
  },

  -- 4. File Explorer
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {},
  },

  -- 5. Flash
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- 6. Debugger (UPDATED with virtual text)
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require("dapui").setup()
      require("nvim-dap-virtual-text").setup()
    end,
  },

  -- 7. Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "󰍵" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  -- 8. Lazygit
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- 9. Trouble (diagnostics panel)
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-web-devicons" },
    opts = {},
  },

  -- 10. Noice (sleek command line + notifications)
  {
    "folke/noice.nvim",
    lazy = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          background_colour = "#000000",
        },
      },
    },
    opts = {},
  },

-- MEGA THEME PACK
{
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("gruvbox").setup({ transparent_mode = true })
  end,
},

{
  "shaunsingh/nord.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    vim.g.nord_disable_background = true
  end,
},

{
  "bluz71/vim-nightfly-colors",
  name = "nightfly",
  priority = 1000,
  lazy = false,
  config = function()
    vim.g.nightflyTransparent = true
  end,
},

{
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  lazy = false,
  config = function()
    require("rose-pine").setup({ disable_background = true })
  end,
},

{
  "rebelot/kanagawa.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("kanagawa").setup({ transparent = true })
  end,
},

{
  "EdenEast/nightfox.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("nightfox").setup({ options = { transparent = true } })
  end,
},

{
  "Mofiqul/dracula.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("dracula").setup({ transparent_bg = true })
  end,
},

{
  "marko-cerovac/material.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    vim.g.material_style = "darker"
    require("material").setup({ disable = { background = true } })
  end,
},

{
  "navarasu/onedark.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("onedark").setup({ transparent = true })
  end,
},

{
  "projekt0n/github-nvim-theme",
  priority = 1000,
  lazy = false,
  config = function()
    require("github-theme").setup({ options = { transparent = true } })
  end,
},

{
  "sainnhe/everforest",
  priority = 1000,
  lazy = false,
  config = function()
    vim.g.everforest_transparent_background = 1
  end,
},

{
  "sainnhe/sonokai",
  priority = 1000,
  lazy = false,
  config = function()
    vim.g.sonokai_transparent_background = 1
  end,
},

{
  "sainnhe/edge",
  priority = 1000,
  lazy = false,
  config = function()
    vim.g.edge_transparent_background = 1
  end,
},

{
  "arcticicestudio/nord-vim",
  priority = 1000,
  lazy = false,
},

{
  "jonathanfilip/vim-lucius",
  priority = 1000,
  lazy = false,
},

-- 11. Lualine (statusline)
{
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { 
          "branch",
          "diff",
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
        },
        lualine_c = {
          { "filename", path = 1, symbols = { modified = " ", readonly = " " } },
        },
        lualine_x = {
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = {
          "progress",
          "location",
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
    })
  end,
},

  -- 12. Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
          highlight = "IblIndent",
        },
        scope = {
          enabled = true,
          highlight = "IblScope",
        },
      })
    end,
  },

  -- 14. Dressing (better UI inputs)
  {
    "stevearc/dressing.nvim",
    lazy = false,
    config = function()
      require("dressing").setup({
        input = {
          enabled = true,
          border = "rounded",
          win_options = { winblend = 0 },
        },
        select = {
          enabled = true,
          backend = { "fzf-lua", "builtin" },
        },
      })
    end,
  },

  -- 15. Treesitter (UPDATED with React/TS)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then return end
      configs.setup({
        ensure_installed = { 
          "cpp", "c", "lua", "python", "sql", "bash",
          "typescript", "tsx", "javascript", "json", "html", "css"
        },
        highlight = { enable = true },
        indent    = { enable = true },
        auto_install = true,
      })
    end,
  },

  -- 16. Auto-close JSX tags
  {
    "windwp/nvim-ts-autotag",
    ft = { "typescriptreact", "javascriptreact", "html" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- 17. Better TypeScript LSP
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayFunctionParameterTypeHints = true,
        },
      },
    },
  },

  -- 18. Package.json versions
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = "json",
    config = function()
      require("package-info").setup()
    end,
  },

  -- 19. Project-wide search/replace
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Spectre",
  },

  -- 20. Surround text objects
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

-- 21. In-line Claude code suggestions
{
  "Cannon07/claude-preview.nvim",
  config = function()
    require("claude-preview").setup({
      diff = { layout = "inline" }, -- or "tab" for side-by-side
    })
  end,
},

-- 22. Fuzzy Finder
{
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup()
  end,
},

{
  "iamcco/markdown-preview.nvim",
  ft = "markdown",
  build = "cd app && npm install",
  config = function()
    vim.g.mkdp_auto_close = 0
  end,
},
