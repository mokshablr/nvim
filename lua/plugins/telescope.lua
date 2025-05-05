-- Telescope
-- Repo URL: https://github.com/nvim-telescope/telescope.nvim
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    {
      'nvim-lua/plenary.nvim',
    },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
    },
  },
  config = function()
    require("telescope").setup {
      extensions = {
        fzf = {}
      }
    }


    local map = vim.keymap
    local builtin = require("telescope.builtin")

    map.set("n", "<leader>pf", function()
      builtin.find_files({
        no_ignore = true, -- Don't respect .gitignore
        hidden = true,    -- Show hidden files like .env, .gitignore
        file_ignore_patterns = {
          "node_modules/",
          "%.env",
          "%.lock",
          "%.git/",
          "dist/",
          "__pycache__/",
          "venv/",
          "raycast/extensions/"
        },
      })
    end, {})

    -- map.set("n", "<C-p>", builtin.git_files)

    -- To serch files in :help
    map.set("n", "<leader>ph", builtin.help_tags, {})

    -- Good for bigger files that struggle with live grep
    map.set("n", "<leader>fg", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)

    -- Live grep search for words in documents
    map.set("n", "<leader>ps", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

    -- Search config files from anywhere
    map.set("n", "<leader>pz", function()
      local opts = {
        cwd = vim.fn.expand("$HOME/.config")

      }
      builtin.find_files(opts)
    end)

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("live_grep_args")
    require("telescope").load_extension("noice")
  end
}
