-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost pack.lua source <afile> | PackerSync
augroup end
]]

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    -- Plugins
    -- FuzzyFinder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    --Trouble- Error messages
    use { 'folke/trouble.nvim' }

    -- Harpoon
    use { 'ThePrimeagen/harpoon' }

    -- File Tree Explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    -- Commenting
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Syntax Highlighting
    use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } })

    -- Auto-close tags
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Neville run code
    use { "s3dman/rundi.nvim" }

    -- nvim-notify
    use { 'rcarriga/nvim-notify' }
    
    -- Lualine Status
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function() require("lualine").setup {} end
    }

    -- Gitsigns for tracking git changes
    use {
        'lewis6991/gitsigns.nvim',
        config = function () require('gitsigns').setup{} end
    }

    -- Blank Indents to demark indentations
    use { 
        "lukas-reineke/indent-blankline.nvim",
    }

    -- TMUX Nav
    use { 'christoomey/vim-tmux-navigator' }

    -- Alpha Dashboard
    use {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    }

    -- Theme
    --OXOCARBON
    -- use { 'nyoom-engineering/oxocarbon.nvim' }
    -- Catpuccin
    use { "catppuccin/nvim", as = "catppuccin" }

    use { 'L3MON4D3/LuaSnip' }
    use { 'rafamadriz/friendly-snippets' }
    use{'hrsh7th/nvim-cmp',
    config = function ()
        require'cmp'.setup {
            snippet = {
                expand = function(args)
                    require'luasnip'.lsp_expand(args.body)
                end
            },

            sources = {
                { name = 'nvim_lsp'},
                { name = 'luasnip' },
                -- more sources
            },
        }
    end
}
use { 'saadparwaiz1/cmp_luasnip' }

-- LSP-Zero LSP
use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
        --Uncomment these if you want to manage LSP servers from neovim
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },

        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'L3MON4D3/LuaSnip' }
    }
}
if packer_bootstrap then
    require('packer').sync()
end
end)
