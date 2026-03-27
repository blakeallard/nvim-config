require "nvchad.mappings"

local map = vim.keymap.set

-- General productivity mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "File Save" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "File Quit" })
map("n", "<leader>x", "<cmd>x<CR>", { desc = "File Save and quit" })

-- Exit insert mode with jk
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

--File tree toggle
map("n", "\\e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree"})

-- Tab settings for 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- Replace the tab navigation with indentation
map("n", "<Tab>", ">>", { desc = "Indent current line" })
map("n", "<S-Tab>", "<<", { desc = "Unindent current line" })
map("i", "<S-Tab>", "<C-d>", { desc = "Unindent in insert mode" })

-- Select all
map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Duplicate line/selection
map("n", "<C-d>", ":t.<CR>", { desc = "Duplicate current line" })
map("v", "<C-d>", ":t'><CR>gv", { desc = "Duplicate selection" })

-- Extended movement (like Ctrl+D/U but for hjkl)
-- map("n", "<C-h>", "5h", { desc = "Move left 5 characters" })
-- map("n", "<C-l>", "5l", { desc = "Move right 5 characters" })
-- map("n", "<C-j>", "5j", { desc = "Move down 5 lines" })
-- map("n", "<C-k>", "5k", { desc = "Move up 5 lines" })

-- Visual mode extended movement
-- map("v", "<C-h>", "5h", { desc = "Extend selection left 5 characters" })
-- map("v", "<C-l>", "5l", { desc = "Extend selection right 5 characters" })
-- map("v", "<C-j>", "5j", { desc = "Extend selection down 5 lines" })
-- map("v", "<C-k>", "5k", { desc = "Extend selection up 5 lines" })

-- Resize windows with arrows
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window up" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window down" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window left" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize window right" })

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", { desc = "Buffer Next" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Buffer Previous" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Buffer Delete" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
map("v", "<Tab>", ">gv", { desc = "Indent right" })
map("v", "<S-Tab>", "<gv", { desc = "Indent left" })

-- Move text up and down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Stay in indent mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Compilation and running mappings
map("n", "<F5>", function()
 local ft = vim.bo.filetype
 if ft == "cpp" then
   vim.cmd("!g++ -o %< % && ./%<")
 elseif ft == "c" then
   vim.cmd("!gcc -o %< % && ./%<")
 elseif ft == "python" then
   vim.cmd("!python3 %")
 elseif ft == "javascript" then
   vim.cmd("!node %")
 elseif ft == "lua" then
   vim.cmd("luafile %")
 else
   print("No run command for filetype: " .. ft)
 end
end, { desc = "Run current file" })

map("n", "<F6>", function()
 local ft = vim.bo.filetype
 if ft == "cpp" then
   vim.cmd("!g++ -g -o %< %")
 elseif ft == "c" then
   vim.cmd("!gcc -g -o %< %")
 else
   print("No compile command for filetype: " .. ft)
 end
end, { desc = "Compile current file" })

-- Terminal mappings
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle horizontal terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggle vertical terminal" })
map("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- LSP mappings (when LSP is attached)
map("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP Go to declaration" })
map("n", "gr", vim.lsp.buf.references, { desc = "LSP References" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "LSP Implementation" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code action" })
map("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "LSP Type definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
map("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP Format" })

-- fzf-lua
map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find files" })
map("n", "<leader>fw", "<cmd>FzfLua live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "Help page" })
map("n", "<leader>ma", "<cmd>FzfLua marks<CR>", { desc = "Find marks" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "Find oldfiles" })
map("n", "<leader>fz", "<cmd>FzfLua blines<CR>", { desc = "Find in current buffer" })
map("n", "<leader>cm", "<cmd>FzfLua git_commits<CR>", { desc = "Git commits" })
map("n", "<leader>gt", "<cmd>FzfLua git_status<CR>", { desc = "Git status" })

-- Git mappings
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

-- Quick substitute
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute word under cursor" })
map("v", "<leader>s", [[:s/\%V]], { desc = "Substitute in selection" })

-- Clear search highlighting
map("n", "<leader>h", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- Quick save all
map("n", "<leader>wa", "<cmd>wa<CR>", { desc = "Save all files" })

-- Tmux Navigator (override NvChad window switching)
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Tmux navigate left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Tmux navigate down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Tmux navigate up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Tmux navigate right" })

-- Move terminal toggle from leader+t to Alt+i
map({ "n", "t" }, "<A-i>", function()
  require("nvterm.terminal").toggle "float"
end, { desc = "Toggle Floating Terminal" })

-- Enable print to .pdf
map("n", "<leader>pd", function()
    vim.cmd("!pygmentize -f html -O style=gruvbox-dark,full=true,linenos=1 % -o /tmp/code.html && sed -i '' 's/<\\/style>/ pre { font-size: 9px; white-space: pre-wrap; word-wrap: break-word; } <\\/style>/' /tmp/code.html && weasyprint /tmp/code.html %<.pdf")
end, { desc = "Export to PDF" })

-- Unbind the old mapping to stop it from getting in the way
