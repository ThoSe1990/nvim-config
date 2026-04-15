-- lua language server: brew install lua-language-server
-- typescript language server: npm install -g typescript
--                             npm install -g typescript-language-server typescript
-- python langugae server: npm install -g pyright
-- editorconfig: brew install editorconfig 
-- riggrep for find strings in all files: brew install ripgrep

local plugins = {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.clang_format.with({
            filetypes = { "c", "cpp", "h" },
          }),
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  bufnr = bufnr,
                  filter = function(c)
                    return c.name == "null-ls"
                  end,
                })
              end,
            })
          end
        end,
      })
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    enabled = true,
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "terrortylor/nvim-comment"
  },
  {
    -- install ripgrep: 
    -- https://github.com/BurntSushi/ripgrep#installation
    -- brew install ripgrep
    -- sudo apt-get install ripgrep
    "nvim-telescope/telescope.nvim"
  },
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
  {
    "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        config = function()
          require("toggleterm").setup{
            size = 20,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            direction = 'horizontal',
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
              border = 'curved',
              winblend = 3,
              highlights = {
                border = "Normal",
                background = "Normal",
              },
            },
          }
        end
  },
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      {"kkharji/sqlite.lua"},
    }
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "typescript-language-server",
      }
    }
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    enabled = true,
    config = function()
        require("todo-comments").setup {
          keywords = {
            FIX = {
                icon = " ", -- icon used for the sign, and in search results
                color = "error", -- can be a hex color, or a named color (see below)
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                -- signs = false, -- configure signs for some keywords individually
            },
            TODO = { icon = " ", color = "info" },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        },
      }
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signs_staged = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signs_staged_enable = true,
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        current_line_blame = true,
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
      }
    end
  },
  {
    "gpanders/editorconfig.nvim"
  },
  {
    'shellRaining/hlchunk.nvim',
    lazy = false,
    config = function()
      require('hlchunk').setup({
        chunk = {
          enable = true,
          use_treesitter = false, -- enables treesitter integration
          duration = 0,
          delay = 0,
          style = {
            { fg = "#6082B6" },
            { fg = "#c21f30" },
          },
          chars = {
              horizontal_line = "─",
              vertical_line = "│",
              left_top = "╭",
              left_bottom = "╰",
              right_arrow = "─",
          },
        },
        indent = {
          enable = false, -- disables indent highlighting
        },
        line_num = {
          enable = true, -- disables line number highlighting
          style = {
            { fg = "#6082B6" },
            { fg = "#c21f30" },
          },
        },
        blank = {
          enable = false, -- disables blank line highlighting
        },
      })
    end
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy.global,
        },
        query = {
          [""] = "rainbow-delimiters",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
}
return plugins
