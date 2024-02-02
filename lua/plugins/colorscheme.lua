-- oxocarbon theme
-- vim.opt.background = "dark" -- set this to dark or light
-- vim.cmd("colorscheme oxocarbon")

require("catppuccin").setup({
    transparent_background = true,
    integrations = {
        harpoon = true,
        mason = true,
    }
})
vim.cmd("colorscheme catppuccin")

