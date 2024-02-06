-- Lualine Status
return{
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function() 
        require("lualine").setup({
            options = {
                icons_enabled = true,
                always_divide_middle = true,
                section_separators = "",
                component_separators = "",
            },
        })
    end 
}
