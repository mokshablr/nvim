-- Snippet engine
-- Repo URL: https://github.com/L3MON4D3/LuaSnip

return {

    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },

        config = function()
            local ls = require("luasnip")
            local s = ls.snippet
            local sn = ls.snippet_node
            local isn = ls.indent_snippet_node
            local t = ls.text_node
            local i = ls.insert_node
            local f = ls.function_node
            local c = ls.choice_node
            local d = ls.dynamic_node
            local r = ls.restore_node
            local events = require("luasnip.util.events")
            local ai = require("luasnip.nodes.absolute_indexer")
            local extras = require("luasnip.extras")
            local l = extras.lambda
            local rep = extras.rep
            local p = extras.partial
            local m = extras.match
            local n = extras.nonempty
            local dl = extras.dynamic_lambda
            local fmt = require("luasnip.extras.fmt").fmt
            local fmta = require("luasnip.extras.fmt").fmta
            local conds = require("luasnip.extras.expand_conditions")
            local postfix = require("luasnip.extras.postfix").postfix
            local types = require("luasnip.util.types")
            local parse = require("luasnip.util.parser").parse_snippet
            local ms = ls.multi_snippet
            local k = require("luasnip.nodes.key_indexer").new_key

            -- Use blanks for newline ("")

            -- For starting of
            ls.add_snippets("c", {
                s("inc", {
                    t({ "#include<stdio.h>", "#include<stdlib.h>" }),
                    t({ "", "", "int main(){", "    " }),
                    i(0),
                    t({ "", "}" })
                })
            })

            -- LuaSnip
            -- vim.keymap.set({"i", "s"}, "<c-k>", function ()
            --     if ls.expand_or_jumpable() then
            --         ls.expand_or_jump()
            --     end
            -- end, {silent = true})
            --
            -- vim.keymap.set({"i", "s"}, "<c-j>", function ()
            --     if ls.expand_or_jumpable(-1) then
            --         ls.expand_or_jump(-1)
            --     end
            -- end, {silent = true})

            vim.keymap.set({ "i", "s" }, "<Tab>",
                function()
                    if ls.expand_or_jumpable() then
                        ls.expand_or_jump()
                    else
                        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
                    end
                end,
                { silent = true })
            vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/plugins/luasnip.lua<CR>")
        end,
    }
}
