local M = {}
M.dap = {
  plugin = true,
  n = {
    -- bindings to scroll 
    ["<C-j>"] = { "3<C-e>", ""},
    ["<C-k>"] = { "3<C-y>", ""},

    -- resizing split 
    -- ["<C-Up>"] = { "<cmd> resize +3<CR>", "Horizontal resize +3" },
    -- ["<C-Down>"] = { "<cmd> resize -3<CR>", "Horizontal resize -3" },
    ["<C-Right>"] = { "<cmd> vertical resize +3<CR>", "Vertical resize +3" },
    ["<C-Left>"] = { "<cmd> vertical resize -3<CR>", "Vertical resize -3" },

    -- create split 

    -- debugger 
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line" },
    ["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue the debugger" },

    -- buffer control
    ["<leader>bh"] = { "<cmd> bp <CR>", "Previous buffer" },
    ["<leader>bk"] = { "<cmd> bn <CR>", "Next buffer" },
    ["<Leader>bd"] = { "<cmd> bd <CR>", "Close buffer" },
    ["<Leader>bD"] = { "<cmd> bd! <CR>", "Close buffer" },
    ["<Leader>ba"] = { "<cmd>bufdo bd<CR>", "Close all buffers" },
    ["<Leader>bh"] = { "<cmd>split<CR><C-w><C-w><cmd>bnext<CR>", "Horizontal split and move buffer, next buffer" },
    ["<Leader>bv"] = { "<cmd>vsplit<CR><C-w><C-w><cmd>bnext<CR>", "Vertical split and move buffer, next buffer" },
    ["<Leader>s"] = { "<cmd>w<CR>", "Save file" },

    ["<leader>q"] = { "<cmd> q <CR>", "Quit"},
    ["<leader>Q"] = { "<cmd> q! <CR>", "Force quit"},

    -- terminal 
    ["<leader>t"] = { "<cmd>ToggleTerm<CR>", "Toggle Terminal" },


    -- git 
    ["<leader>gc"] = { "<cmd>DiffviewOpen<CR>", "Open changes/git diffs"},
  },
}
return M
