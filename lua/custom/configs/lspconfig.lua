local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities


vim.lsp.config("clangd", {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})
vim.lsp.enable("clangd")


vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
  },
  cmd = { "typescript-language-server", "--stdio" },
})
vim.lsp.enable("ts_ls")

-- Python
vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.enable("pyright")