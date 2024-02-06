return{ 
    --Trouble- Error messages
    'folke/trouble.nvim',

    -- TMUX Nav
    'christoomey/vim-tmux-navigator',

    -- Comments
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
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
        config = function()
            require('nvim-highlight-colors').setup()
        end
    },
}
