-- Plugins with minimal config

return {
    --Trouble- Error messages
    'folke/trouble.nvim',

    -- TMUX Nav
    'christoomey/vim-tmux-navigator',

    {
        "j-hui/fidget.nvim",
        config = function () require("fidget").setup{} end,
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
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
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
}
