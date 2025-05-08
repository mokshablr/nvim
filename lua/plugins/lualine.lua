-- Lualine Statusline
-- Repo URL: https://github.com/nvim-lualine/lualine.nvim

return {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_x = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          }
        },
      },
      options = {
        theme = 'dracula',
        icons_enabled = true,
        always_divide_middle = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
    })
  end
}
