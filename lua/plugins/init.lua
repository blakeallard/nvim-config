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
          section_separators   = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            { "mode", separator = { left = "", right = "" } },
          },
          lualine_b = {
            { "filename", path = 3, symbols = { modified = "  ", readonly = " ", unnamed = " [No Name]" } },
            { "branch", icon = "" },
          },
          lualine_c = {
            { "diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " " } },
          },
          lualine_x = {
            { "filetype", icon_only = false },
          },
          lualine_y = { "progress" },
          lualine_z = {
            { "location", separator = { left = "", right = "" } },
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

  -- 13. Dashboard
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("dashboard").setup({
        theme = "doom",
        config = {
          header = {
            "",
            "",
            "  ██████╗ ██╗      █████╗ ██╗  ██╗███████╗",
            "  ██╔══██╗██║     ██╔══██╗██║ ██╔╝██╔════╝",
            "  ██████╔╝██║     ███████║█████╔╝ █████╗  ",
            "  ██╔══██╗██║     ██╔══██║██╔═██╗ ██╔══╝  ",
            "  ██████╔╝███████╗██║  ██║██║  ██╗███████╗",
            "  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝",
            "",
            "",
          },
          center = {
            {
              icon   = "  ",
              desc   = "Find File",
              key    = "f",
              action = "Telescope find_files",
            },
            {
              icon   = "  ",
              desc   = "Recent Files",
              key    = "r",
              action = "Telescope oldfiles",
            },
            {
              icon   = "  ",
              desc   = "Find Word",
              key    = "g",
              action = "Telescope live_grep",
            },
            {
              icon   = "  ",
              desc   = "Config",
              key    = "c",
              action = "edit ~/.config/nvim/lua/plugins/init.lua",
            },
            {
              icon   = "  ",
              desc   = "Quit",
              key    = "q",
              action = "qa",
            },
          },
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
          backend = { "telescope", "builtin" },
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

}
