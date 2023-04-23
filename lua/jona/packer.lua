return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSupdate' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                              -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-nvim-lua' }, -- Required
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'hrsh7th/cmp-path' }
        }
    }

    use {
        "FotiadisM/tabset.nvim",
        config = function()
            require("tabset").setup()
        end
    }

    use {
        's1n7ax/nvim-terminal',
        config = function()
            vim.o.hidden = true
            require('nvim-terminal').setup()
        end,
    }

    -- Debugger stuff
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'mortepau/codicons.nvim'

    use 'tjdevries/stackmap.nvim'
end)
