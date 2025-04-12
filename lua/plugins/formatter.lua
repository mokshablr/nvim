return {
    {
        'mhartington/formatter.nvim',
        config = function ()
            local home = os.getenv("HOME")
            logging = false
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
                lua = {
                    function()
                        return {
                            exe = "stylua",
                            args = { "-" },
                            stdin = true,
                        }
                    end,
                },
                java = {
                    function()
                        return {
                            exe = "java",
                            -- Formatter uses '-' as stdin
                            args = { "-jar", home .. "/.local/jars/google-java-format.jar", "-" },
                            stdin = true,
                        }
                    end,
                },
            }

            local augroup = vim.api.nvim_create_augroup
            local autocmd = vim.api.nvim_create_autocmd
            augroup("__formatter__", { clear = true })
            autocmd("BufWritePost", {
                group = "__formatter__",
                command = ":FormatWrite",
            })
        end
    }
}
