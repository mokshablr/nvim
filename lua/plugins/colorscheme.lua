-- Colorscheme for nvim
-- Repo URL: https://github.com/jesseleite/nvim-noirbuddy

return {
  {
    "jesseleite/nvim-noirbuddy",
    enabled = false,
    dependencies = {
      { "tjdevries/colorbuddy.nvim", branch = "dev" },
    },
    lazy = false,
    priority = 1000,
    config = function()
      require("noirbuddy").setup({
        preset = "minimal",
        colors = {
          primary = "#b6fa73",
        },
      })
      -- Error highlighting
      -- noir-buddy
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = "#ff0038" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { fg = "#ffc800" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { fg = "#47eae0" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { fg = "#47eae0" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineOk", { fg = "LightGreen" })
      vim.api.nvim_set_hl(0, "ErrorMsg", { fg = "Red" })
    end,
  },
  {
    "catppuccin/nvim",
    enabled = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",              -- latte, frappe, macchiato, mocha
        transparent_background = false, -- disables setting the background color.
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "folke/tokyonight.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        opacity = 0.1,
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
