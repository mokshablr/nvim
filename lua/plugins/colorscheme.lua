return{
    {
        'jesseleite/nvim-noirbuddy',
        dependencies = {
            { 'tjdevries/colorbuddy.nvim', branch = 'dev' }
        },
        lazy = false,
        priority = 1000,
        config = function ()
            require('noirbuddy').setup {
                preset = 'minimal',
                colors ={
                    primary="#f9e2af"
                }
            }
        end
    }
}


-- Theme
--OXOCARBON
-- use { 'nyoom-engineering/oxocarbon.nvim' }
-- Catpuccin
-- use { "catppuccin/nvim", as = "catppuccin" }
