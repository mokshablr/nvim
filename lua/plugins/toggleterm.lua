-- ToggleTerm

return{
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        lazy = false,
        config = function ()
            require("toggleterm").setup{}
        end
    }
}
