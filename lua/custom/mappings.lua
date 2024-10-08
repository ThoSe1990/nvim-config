local M = {}
M.dap = {
  plugin = true,
  n = {
    -- bindings to scroll 
    ["<C-j>"] = { "3<C-e>", ""},
    ["<C-k>"] = { "3<C-y>", ""},

    -- resizing split 
    ["<C-Up>"] = { "<cmd> resize +3<CR>", "Horizontal resize +3" },
    ["<C-Down>"] = { "<cmd> resize -3<CR>", "Horizontal resize -3" },
    ["<C-Right>"] = { "<cmd> vertical resize +3<CR>", "Vertical resize +3" },
    ["<C-Left>"] = { "<cmd> vertical resize -3<CR>", "Vertical resize -3" },

    -- debugger 
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line" },
    ["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue the debugger" },

    -- git
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>ghr"] = { "<cmd> Gitsigns reset_hunk <CR>", "Reset hunk"},
    ["<leader>ghs"] = { "<cmd> Gitsigns stage_hunk <CR>", "Stage hunk"},
    ["<leader>ghu"] = { "<cmd> Gitsigns undo_stage_hunk <CR>", "Undo stage hunk"},
    ["<leader>gbs"] = { "<cmd> Gitsigns stage_buffer<CR>", "Stage buffer"},
    ["<leader>gbr"] = { "<cmd> Gitsigns reset_buffer<CR>", "Reset buffer"},
    ["<leader>gd"] = { "<cmd> Gitsigns diffthis<CR>", "Show diffs"},
    ["<leader>gp"] = { "<cmd> Gitsigns preview_hunk<CR>", "Preview hunk"},

    -- buffer control
    ["<leader>bh"] = { "<cmd> bp <CR>", "Previous buffer" },
    ["<leader>bk"] = { "<cmd> bn <CR>", "Next buffer" },
    ["<leader>bm"] = { "<cmd> :enew <CR>", "New buffer" },
    ["<leader>bn"] = { "<cmd> :vnew <CR>", "New buffer (vertical)" },
    ["<Leader>bd"] = { "<cmd> bd <CR>", "Close buffer" },
    ["<Leader>bf"] = { "<cmd> bp | bd # <CR>", "Close buffer and maintain layout" },
    ["<Leader>bD"] = { "<cmd> bd! <CR>", "Close buffer" },
    ["<Leader>ba"] = { "<cmd>bufdo bd<CR>", "Close all buffers" },
    ["<leader>bo"] = { "<cmd>%bd|e#<CR>", "Close buffers but the current one" },
    ["<Leader>bh"] = { "<cmd>split<CR><C-w><C-w><cmd>bnext<CR>", "Horizontal split and move buffer, next buffer" },
    ["<Leader>bv"] = { "<cmd>vsplit<CR><C-w><C-w><cmd>bnext<CR>", "Vertical split and move buffer, next buffer" },
    ["<Leader>s"] = { "<cmd>w<CR>", "Save file" },
    ["<leader>q"] = { "<cmd> q <CR>", "Quit"},
    ["<leader>Q"] = { "<cmd> q! <CR>", "Force quit"},

    -- terminal 
    ["<leader>t"] = { "<cmd>ToggleTerm<CR>", "Toggle Terminal" },


    -- git 
    ["<leader>gc"] = { "<cmd>DiffviewOpen<CR>", "Open changes/git diffs"},
    ["<leader>gg"] = { "<cmd>Flog<CR>", "Open git graph"},
    ["<leader>gs"] = { "<cmd>Flogsplit<CR>", "Open git graph (split)"},
  },
}
return M
