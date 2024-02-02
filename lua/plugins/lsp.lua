local lsp = require('lsp-zero')


-- lsp.on_attach(function(client, bufnr)
--     -- see :help lsp-zero-keybindings
--     -- to learn the available actions
--     lsp.default_keymaps({buffer = bufnr})
-- end)
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {"pyright", "clangd","tsserver"},
    handlers = {
        lsp.default_setup,

        ["lua_ls"] = function ()
            local lspconfig = require("lspconfig")
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
    },
})

vim.diagnostic.config({
  virtual_text = false,
})
