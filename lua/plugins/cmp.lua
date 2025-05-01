-- Auto-completion
-- Repo URL: https://github.com/hrsh7th/nvim-cmp

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{
			{
				-- LuaSnip for snippet engine and custom snippets
				"L3MON4D3/LuaSnip",
				-- follow latest release.
				version = "v2.*", -- Replace <CurrentMajor> by the latest released major
				-- install jsregexp (optional!).
				build = "make install_jsregexp",
			},
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
	},
	-- event = "InsertEnter",

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").load()
		luasnip.filetype_extend("javascript", { "html" })

		local has_words_before = function()
			local row, col = unpack(vim.api.nvim_win_get_cursor(0))
			if col == 0 then
				return false
			end
			local line = vim.api.nvim_buf_get_lines(0, row - 1, row, true)[1]
			return line:sub(col, col):match("%w") ~= nil
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "cmdline" },
			}, {
				{ name = "buffer" },
			}),

			mapping = {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- that way you will only jump inside the snippet region
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
					else
						fallback()
					end
				end, { "i", "s" }),

				["<CR>"] = cmp.mapping.confirm({ select = false }),

				-- To make ESC hide the suggestions
				-- ["<Esc>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		cmp.close()
				-- 	else
				-- 		fallback() -- <Esc> now falls back to exit Insert mode
				-- 	end
				-- end, { "i", "s" }),
			},

			completion = {
				autocomplete = false,
				completeopt = "menu,menuone,noinsert,noselect",
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
        
        -- Autocomplete only after an alphanumeric
		vim.api.nvim_create_autocmd("TextChangedI", {
			pattern = "*",
			callback = function()
				local row, col = unpack(vim.api.nvim_win_get_cursor(0))
				local line = vim.api.nvim_get_current_line()
				if line:match("^%s*$") then
					-- If the line is empty or only whitespace, close completion
					if cmp.visible() then
						cmp.close()
					end
					return
				end
				if col == 0 then
					return
				end
				local char_before = line:sub(col, col)
				if char_before:match("%w") then
					cmp.complete()
				end
			end,
		})

		-- `/` cmdline setup for buffer search
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			completion = { autocomplete = { cmp.TriggerEvent.TextChanged } },
			sources = {
				{ name = "buffer" },
			},
		})

		-- `:` cmdline setup for commands and paths
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			completion = { autocomplete = { cmp.TriggerEvent.TextChanged } },
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
						treat_trailing_slash = false,
					},
				},
			}),
		})
	end,
}
