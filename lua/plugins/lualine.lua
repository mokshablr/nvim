-- Lualine Statusline
-- Repo URL: https://github.com/nvim-lualine/lualine.nvim

return {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
        require("lualine").setup({
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
