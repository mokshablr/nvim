-- Auto-completion

return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        { {
            -- LuaSnip for snippet engine and custom snippets
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp"
        } },
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "neovim/nvim-lspconfig",
    },
    -- event = "InsertEnter",
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        require("luasnip.loaders.from_vscode").load()
        luasnip.filetype_extend("javascript", { "html" })

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
            },
            mapping = cmp.mapping.preset.insert({
                -- `Enter` key to confirm completion
                ['<Tab>'] = cmp.mapping.confirm({ select = false }),


            }),
            completion = {
                completeopt = "menu, menuone, noinsert"
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            }

        })
    end,
}
