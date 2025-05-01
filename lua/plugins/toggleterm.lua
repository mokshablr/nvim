-- ToggleTerm
-- Repo URL: https://github.com/akinsho/toggleterm.nvim

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
