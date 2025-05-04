local map = vim.keymap
vim.g.mapleader = " "
map.set("n", "<leader>pv", vim.cmd.Ex)

-- source current file
map.set("n", "<leader>rr", function()
  vim.cmd("luafile %")
  vim.notify("NVIM config reloaded!", vim.log.levels.INFO)
end, { desc = "Reload config" })

-- Custom Remaps
-- Move selected lines
map.set("v", "J", ":m '>+1<CR>gv=gv")
map.set("v", "K", ":m '<-2<CR>gv=gv")

-- Copy and paste over other words. Keep copied word in the register.
map.set("x", "<leader>p", '"_dP')

-- Copy to sys clipboard
map.set("n", "<leader>y", '"+y')
map.set("v", "<leader>y", '"+y')
map.set("n", "<leader>Y", '"+Y')

-- Diagnostic popup
map.set("n", "<leader>i", function()
  vim.diagnostic.open_float()
end)

-- Plugins
-- nvim-tree
map.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- Toggle
map.set("n", "<leader>d", ":NvimTreeFocus<CR>")  -- Focus on tree when file already open
map.set("n", "<leader>c", ":NvimTreeFindFile<CR>")

--Trouble - Error messages
map.set("n", "<leader>l", function()
  require("trouble").toggle()
end)
map.set("n", "<leader>xw", function()
  require("trouble").toggle("workspace_diagnostics")
end)
map.set("n", "<leader>h", function()
  require("trouble").toggle("document_diagnostics")
end)
map.set("n", "<leader>xq", function()
  require("trouble").toggle("quickfix")
end)
map.set("n", "<leader>xl", function()
  require("trouble").toggle("loclist")
end)
map.set("n", "gr", function()
  require("trouble").toggle("lsp_references")
end)

-- ToggleTerm
map.set("n", "<leader>t", ":ToggleTerm<CR>")

-- Undotree
vim.g.undotree_SetFocusWhenToggle = 1
map.set("n", "<leader>u", function()
  vim.cmd("UndotreeToggle")
end)


-- Diagnostics
map.set("n", "<leader>i", vim.diagnostic.open_float)
map.set("n", "[d", vim.diagnostic.goto_prev)
map.set("n", "]d", vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    map.set("n", "gD", vim.lsp.buf.declaration, opts)
    map.set("n", "gd", vim.lsp.buf.definition, opts)
    map.set("n", "K", vim.lsp.buf.hover, opts)
    map.set("n", "gi", vim.lsp.buf.implementation, opts)
    map.set("n", "<leader>k", vim.lsp.buf.signature_help, opts)
    map.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    map.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    map.set("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
    end, opts)
    map.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    map.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    -- map.set('n', 'gr', vim.lsp.buf.references, opts)      Currenly used by trouble
    map.set("n", "<leader>]", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})
