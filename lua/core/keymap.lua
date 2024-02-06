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

-- Format file
map.set("n", "<leader>]", function()
    vim.lsp.buf.format()
end)

-- Diagnostic popup
map.set("n", "<leader>i", function() vim.diagnostic.open_float() end)

-- Plugins
-- Telescope
local builtin = require('telescope.builtin')
map.set('n', '<leader>pf', builtin.find_files, {})
map.set('n', '<C-p>', builtin.git_files, {})
map.set('n', '<leader>ps', function()
	builtin.grep_string({search = vim.fn.input("Grep > ") });
end)

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
map.set("n", "<leader>gr", function() require("trouble").toggle("lsp_references") end)

-- ToggleTerm
map.set("n", "<leader>`", ":ToggleTerm<CR>")
