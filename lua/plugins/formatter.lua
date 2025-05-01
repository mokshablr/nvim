-- Auto-formatter
-- Repo URL: https://github.com/mhartington/formatter.nvim

return {
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        logging = false,
        filetype = {
          javascript = {
            -- prettier
            function()
              return {
                exe = "prettier",
                args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
                stdin = true,
              }
            end,
          },
          rust = {
            -- Rustfmt
            function()
              return {
                exe = "rustfmt",
                args = { "--edition=2018", "--emit=stdout" },
                stdin = true,
              }
            end,
          },
          go = {
            function()
              return {
                exe = "gofmt",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end,
          },
        },
      })

      -- For autoformatting
      -- local augroup = vim.api.nvim_create_augroup
      -- local autocmd = vim.api.nvim_create_autocmd
      -- augroup("__formatter__", { clear = true })
      -- autocmd("BufWritePost", {
      --   group = "__formatter__",
      --   command = ":FormatWrite",
      -- })

      -- default formatter to vim.lsp.buf.format()
      local fmt_group = vim.api.nvim_create_augroup("__formatter__", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = fmt_group,
        callback = function()
          local ft = vim.bo.filetype
          local util = require("formatter.util")
          if #util.get_available_formatters_for_ft(ft) > 0 then
            vim.cmd("Format")                     -- format buffer in-place, no write :contentReference[oaicite:3]{index=3}
          else
            vim.lsp.buf.format({ async = false }) -- sync LSP format before write
          end
        end,
      })
    end,
  },
}
