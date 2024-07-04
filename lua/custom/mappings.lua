local M = {}
M.dap = {
  plugin = true,
  n = {
    ["<C-j>"] = { "<C-e>", ""},
    ["<C-k>"] = { "<C-y>", ""},
    ["<leader>mv"] = { "<cmd>vsplit | wincmd l | b# | wincmd h | q<CR>", "Move current buffer to right split" },
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line" },
    ["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue the debugger" },
    ["<leader>h"] = { "<cmd> bp <CR>", "Previous buffer" },
    ["<leader>k"] = { "<cmd> bn <CR>", "Next buffer" },
    ["<leader>t"] = { "<cmd>ToggleTerm<CR>", "Toggle Terminal" },
    ["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Find files" },
    ["<leader>fg"] = { "<cmd>Telescope live_grep<CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd>Telescope buffers<CR>", "Telescope buffers" },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<CR>", "Help Tags" },
  }
}
return M
