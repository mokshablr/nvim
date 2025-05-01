-- ToggleTerm
-- Repo URL: https://github.com/akinsho/toggleterm.nvim

return {
  {
    'akinsho/toggleterm.nvim',
    enabled = false,
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup {}
    end
  }
}
