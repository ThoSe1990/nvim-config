local M = {}
M.dap = {
  plugin = true,
  n = {
    -- bindings to scroll 
    ["<C-j>"] = { "<C-e>", ""},
    ["<C-k>"] = { "<C-y>", ""},

    -- resizing split 
    ["<C-Up>"] = { "<cmd> resize +3<CR>", "Horizontal resize +3" },
    ["<C-Down>"] = { "<cmd> resize -3<CR>", "Horizontal resize -3" },
    ["<C-Left>"] = { "<cmd> vertical resize +3<CR>", "Vertical resize +3" },
    ["<C-Right>"] = { "<cmd> vertical resize -3<CR>", "Vertical resize -3" },

    -- create split 
    ["<Leader>sh"] = { "<cmd>split<CR><C-w><C-w><cmd>bnext<CR>", "Horizontal split and move buffer, next buffer" },
    ["<Leader>sv"] = { "<cmd>vsplit<CR><C-w><C-w><cmd>bnext<CR>", "Vertical split and move buffer, next buffer" },

    -- debugger 
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line" },
    ["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue the debugger" },

    -- buffer control
    ["<leader>h"] = { "<cmd> bp <CR>", "Previous buffer" },
    ["<leader>k"] = { "<cmd> bn <CR>", "Next buffer" },
    ["<Leader>q"] = { "<cmd>bd<CR>", "Close buffer" },
    ["<Leader>Q"] = { "<cmd>bufdo bd<CR>", "Close all buffers" },
    ["<Leader>s"] = { "<cmd>w<CR>", "Save file" },

    -- terminal 
    ["<leader>t"] = { "<cmd>ToggleTerm<CR>", "Toggle Terminal" },

  },
}
return M
