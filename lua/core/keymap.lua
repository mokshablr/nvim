local map = vim.keymap
vim.g.mapleader = " "
map.set("n", "<leader>pv", vim.cmd.Ex)


-- Custom Remaps
-- Move selected lines
map.set("v", "J", ":m '>+1<CR>gv=gv")
map.set("v", "K", ":m '<-2<CR>gv=gv")

-- Copy and paste over other words. Keep copied word in the register.
map.set("x", "<leader>p", "\"_dP")

-- Copy to sys clipboard
map.set("n", "<leader>y", "\"+y")
map.set("v", "<leader>y", "\"+y")
map.set("n", "<leader>Y", "\"+Y")

-- Diagnostic popup
map.set("n", "<leader>i", function() vim.diagnostic.open_float() end)

-- Plugins
-- Telescope
local builtin = require('telescope.builtin')
map.set('n', '<leader>pf', builtin.find_files, {})
map.set('n', '<C-p>', builtin.git_files, {})
map.set('n', '<leader>fg', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
map.set("n", "<leader>ps", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- nvim-tree
map.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- Toggle
map.set("n", "<leader>d", ":NvimTreeFocus<CR>")  -- Focus on tree when file already open
map.set("n", "<leader>c", ":NvimTreeFindFile<CR>")

--Trouble - Error messages
map.set("n", "<leader>l", function() require("trouble").toggle() end)
map.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
map.set("n", "<leader>h", function() require("trouble").toggle("document_diagnostics") end)
map.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
map.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
map.set("n", "gr", function() require("trouble").toggle("lsp_references") end)

-- ToggleTerm
map.set("n", "<leader>`", ":ToggleTerm<CR>")

-- Diagnostics
vim.keymap.set('n', '<leader>i', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)      Currenly used by trouble
        vim.keymap.set('n', '<leader>]', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end
})
