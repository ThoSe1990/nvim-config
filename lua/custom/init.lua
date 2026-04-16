vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.foldmethod = "indent"
    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt.foldlevel = 99
  end,
})
