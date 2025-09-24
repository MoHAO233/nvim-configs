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
    build = "make",
    opts = {
      watermark = "",
    }
  },
}
