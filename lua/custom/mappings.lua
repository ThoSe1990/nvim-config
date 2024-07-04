local M = {}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
    ["<leader>h"] = {
      "<cmd> bp <CR>",
      "Previous buffer"
    },
    ["<leader>k"] = {
      "<cmd> bn <CR>",
      "Next buffer"
    },
    ["<leader>t"] = { 
      "<cmd>ToggleTerm<CR>",
      "Toggle Terminal"
    }
  }
}
return M