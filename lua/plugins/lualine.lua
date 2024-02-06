return{
    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = "palenight",
            always_divide_middle = true,
            section_separators = "",
            component_separators = "",
        },
        extensions = { -- TODO
        "fugitive",
        "fzf",
        },
    })
}
