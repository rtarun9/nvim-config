vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope plugin.
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- Kanagawa theme.
    use 'rebelot/kanagawa.nvim'

    -- Treesitter.
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- Undotree.
    use 'mbbill/undotree'

    -- Status line.
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- nvim-tree.
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    -- lsp.
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'VonHeikemen/lsp-zero.nvim',
    }

    -- toggle term.
    use {
        'akinsho/toggleterm.nvim',
    }

    -- todo-comments.
    use {
        'folke/todo-comments.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
end)
