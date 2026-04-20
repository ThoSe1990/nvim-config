vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local ok = pcall(vim.treesitter.get_parser, 0)
    vim.opt_local.foldmethod = "indent"
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldlevel = 99
  end,
})


-- Oil: Enter open directory in Oil explorer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    local oil = require("oil")

    vim.keymap.set("n", "<CR>", function()
      oil.select()
    end, { buffer = true, desc = "Oil: enter directory / open file" })
  end,
})
-- Oil: Esace closes Oil file explorer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    local oil = require("oil")

    vim.keymap.set("n", "<CR>", function()
      oil.select()
    end, { buffer = true, desc = "Oil: open / enter directory" })

    vim.keymap.set("n", "<Esc>", function()
      oil.close()
    end, { buffer = true, desc = "Oil: close" })
  end,
})
