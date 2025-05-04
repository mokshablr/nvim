-- Plugins with minimal config

return {
  --Trouble- Error messages
  'folke/trouble.nvim',

  -- git fugitive
  'tpope/vim-fugitive',

  -- TMUX Nav
  'christoomey/vim-tmux-navigator',

  {
    "j-hui/fidget.nvim",
    config = function() require("fidget").setup {} end,
  },

  -- Comments
  {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  },

  -- Auto-close tags
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },

  -- Gitsigns for tracking git changes
  {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup {} end
  },

  -- Nvim-Highlight-Colors - show color "overlay"
  {
    'brenoprata10/nvim-highlight-colors',
    config = function() require('nvim-highlight-colors').setup() end
  },

  {
    'tris203/precognition.nvim',
    config = function() require('precognition').setup() end
  },

  {
    'aaron-p1/match-visual.nvim',
    config = function()
      require('match-visual').setup({
        min_length = 1,
        hl_group = "Visual"
      })
    end
  },


  {
    "mbbill/undotree",
  }
}
