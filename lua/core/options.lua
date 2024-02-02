local opt = vim.opt

-- Keeps cursor thicc
opt.guicursor = ""

-- Numbering and Relative Numbering
opt.nu = true
opt.relativenumber = true

-- Indenting
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Turn off highlight for search
opt.hlsearch = false
opt.incsearch = true

-- Use better terminal colors
opt.termguicolors = true

-- Limit the vertical cursor padding to 15 lines
opt.scrolloff = 15

-- Number of popup suggestions
opt.pumheight = 5

-- Turn of case-sensitivity for /find
opt.ignorecase = true

-- Continuous floating diagnostics
-- vim.o.updatetime = 450
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
--   callback = function ()
--     vim.diagnostic.open_float(nil, {focus=false})
--   end
-- })
