return{
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        lazy = false,
        config = function ()
            require("toggleterm").setup{
                open_mapping = [[<leader>`]]
            }
        end
    }
}
