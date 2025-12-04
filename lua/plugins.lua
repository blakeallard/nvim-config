return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      
      dapui.setup()
      
      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
      }
      
      dap.configurations.cpp = {
        {
          name = "Debug Current Project",
          type = "cppdbg",
          request = "launch",
          program = function()
            local cwd = vim.fn.getcwd()
            local possible_exes = {
              cwd .. "/main",
              cwd .. "/a.out",
              cwd .. "/app",
              cwd .. "/program"
            }
            
            for _, exe in ipairs(possible_exes) do
              if vim.fn.filereadable(exe) == 1 then
                return exe
              end
            end
            
            return vim.fn.input("Executable: ", cwd .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = false,
        },
      }
      
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
}
