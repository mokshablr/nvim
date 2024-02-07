-- Lsp setup using mason and nvim-lspconfig

return {
    {
        "https://github.com/williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
    },
    {
        "https://github.com/williamboman/mason-lspconfig.nvim",
        dependencies = { 'neovim/nvim-lspconfig' },
        config = function()
            local mason_lsp = require('mason-lspconfig')
            local lspconfig = require('lspconfig')
            mason_lsp.setup({
                ensure_installed = {"pyright", "clangd","tsserver", "rust_analyzer", "html"},
                handlers = {
                    -- server setup handler
                    function(server)
                        lspconfig[server].setup({})
                    end,

                    ["lua_ls"] = function ()
                        lspconfig.lua_ls.setup {
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        -- Sets vim as a global var to avoid undefined vim warnings
                                        globals = { "vim" },
                                    }
                                }
                            }
                        }
                    end,
                    ["rust_analyzer"] = function()
                        lspconfig.rust_analyzer.setup {
                            settings = {
                                ['rust_analyzer'] = {
                                    check = {
                                        command = "clippy";
                                    },
                                    diagnostics = {
                                        enable = true;
                                    }
                                }
                            }
                        }
                    end,
                },
            })

        end,

    }
}
