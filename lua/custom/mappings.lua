local M = {}
M.dap = {
  plugin = false,
  v = {
    -- cursor movement 
    ["L"] = { "g_", "Move cursor to the end of a line" },
    ["H"] = { "^", "Move cursor to the beginning of a line" },
  },
  n = {
    -- cursor movement 
    ["L"] = { "g_", "Move cursor to the end of a line" },
    ["H"] = { "^", "Move cursor to the beginning of a line" },

    -- bindings to scroll 
    ["<C-j>"] = { "3<C-e>", ""},
    ["<C-k>"] = { "3<C-y>", ""},

    -- resizing split 
    ["<C-S-Up>"] = { "<cmd> resize +3<CR>", "Horizontal resize +3" },
    ["<C-S-Down>"] = { "<cmd> resize -3<CR>", "Horizontal resize -3" },
    ["<C-S-Right>"] = { "<cmd> vertical resize +3<CR>", "Vertical resize +3" },
    ["<C-S-Left>"] = { "<cmd> vertical resize -3<CR>", "Vertical resize -3" },

    -- debugging
    ["<F5>"] = { function() require("dap").continue() end, "Start/Continue debugging" },
    ["<leader>ds"] = { function() require("dap").continue() end, "Start/Continue debugging" },
    ["<F10>"] = { function() require("dap").step_over() end, "Step over" },
    ["<F11>"] = { function() require("dap").step_into() end, "Step into" },
    ["<F12>"] = { function() require("dap").step_out() end, "Step out" },

    ["<leader>db"] = { function() require("dap").toggle_breakpoint() end, "Toggle breakpoint" },
    ["<leader>dB"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      "Conditional breakpoint",
    },

    ["<leader>du"] = { function() require("dapui").toggle() end, "Toggle DAP UI" },
    ["<leader>dr"] = { function() require("dap").repl.open() end, "Open DAP REPL" },
    ["<leader>dl"] = { function() require("dap").run_last() end, "Run last debug session" },

    -- git
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>ghr"] = { "<cmd> Gitsigns reset_hunk <CR>", "Reset hunk"},
    ["<leader>ghs"] = { "<cmd> Gitsigns stage_hunk <CR>", "Stage hunk"},
    ["<leader>ghu"] = { "<cmd> Gitsigns undo_stage_hunk <CR>", "Undo stage hunk"},
    ["<leader>ghp"] = { "<cmd> Gitsigns preview_hunk <CR>", "Preview hunk"},
    ["<leader>gbs"] = { "<cmd> Gitsigns stage_buffer<CR>", "Stage buffer"},
    ["<leader>gbr"] = { "<cmd> Gitsigns reset_buffer<CR>", "Reset buffer"},

    --git diffs 
    ["<leader>gdc"] = { "<cmd> DiffviewOpen <CR>", "Diffview open current changes" },
    ["<leader>gdm"] = { "<cmd> DiffviewOpen origin/master...HEAD <CR>", "Diffview open master" },
    ["<leader>gdn"] = { "<cmd> DiffviewOpen origin/main...HEAD <CR>", "Diffview open main" },

    -- tabs
    ["<leader>tc"] = { "<cmd> tabclose <CR>", "Close tab" },
    ["<leader>tl"] = { "<cmd> tabnext <CR>", "Next tab" },
    ["<leader>th"] = { "<cmd> tabprev <CR>", "Prev tab" },
    ["<leader>tn"] = { "<cmd> tabnew <CR>", "Open new tab" },

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
