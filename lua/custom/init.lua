vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local ok = pcall(vim.treesitter.get_parser, 0)
    vim.opt_local.foldmethod = "indent"
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldlevel = 99
  end,
})
