return {
  {
    "echasnovski/mini.pairs",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "cpp"},
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    opts = {
      template_file = {
        cpp = "~/Code/.template.cpp",
      },
      compile_command = {
        cpp = {
          exec = "g++-15",
          args = {
            "-Wall",
            "$(FNAME)",
            "-o",
            "$(FNOEXT)",
            "-std=gnu++23",
          }
        }
      }
    },
  },
  {
    "mistricky/codesnap.nvim",
    enabled = not vim.fn.stdpath("config"):find("com.termux"),
    build = "make",
    opts = {
      watermark = "",
    }
  },
  -- 自动补全核心
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source
      "hrsh7th/cmp-buffer",   -- buffer words
      "hrsh7th/cmp-path",     -- filesystem paths
      "L3MON4D3/LuaSnip",     -- snippets engine（nvim-cmp 依赖）
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- LSP 配置
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config["clangd"] = {
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--header-insertion=never",
        },
      }
      vim.lsp.enable("clangd")
    end,
  },
}

