local border = {
    { '┌', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '┐', 'FloatBorder' },
    { '│', 'FloatBorder' },
    { '┘', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '└', 'FloatBorder' },
    { '│', 'FloatBorder' },
}

local handlers = {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}



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
                    ["html"] = function ()
                        lspconfig.html.setup({
                            handlers = handlers,
                            settigns = {
                                css = {
                                    lint = {
                                        validProperties = {},
                                    },
                                },
                            },
                        })
                    end
                },
            })

        end,

    }
}
