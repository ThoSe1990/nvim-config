require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"


-- clang-format auto formatting before document safe
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.cpp", "*.hpp", "*.c", "*.cc", "*.h" },
  callback = function()
    -- save cursor position
    local pos = vim.api.nvim_win_get_cursor(0)

    -- only format if clangd is attached
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    for _, client in ipairs(clients) do
      if client.name == "clangd" then
        vim.lsp.buf.format({
          async = false,
          filter = function(c)
            return c.name == "clangd"
          end,
        })
        break
      end
    end

    -- restore cursor position (usually unnecessary, but keeps your behavior)
    pcall(vim.api.nvim_win_set_cursor, 0, pos)
  end,
})

-- explicit clipboard copy / paste for docker use 
local osc52 = require('vim.ui.clipboard.osc52')

vim.g.clipboard = {
  name = "osc52",
  copy = {
    ["+"] = osc52.copy("+"),
    ["*"] = osc52.copy("*"),
  },
  paste = {
    ["+"] = osc52.paste("+"),
    ["*"] = osc52.paste("*"),
  },
}
