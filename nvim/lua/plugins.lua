
vim.pack.add {
    -- Dependencies
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    -- LSP
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/saghen/blink.lib',
    'https://github.com/saghen/blink.cmp',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    -- Main
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/folke/which-key.nvim',
    -- Misc
    'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/mluders/comfy-line-numbers.nvim',
    'https://github.com/lukas-reineke/indent-blankline.nvim',
    'https://github.com/windwp/nvim-autopairs',
    -- Themes
    'https://github.com/catppuccin/nvim',
    'https://github.com/folke/tokyonight.nvim',
    'https://github.com/tiagovla/tokyodark.nvim',
    'https://github.com/Shatur/neovim-ayu',
    'https://github.com/rebelot/kanagawa.nvim'
}

require('lualine').setup()
require('comfy-line-numbers').setup()
require('nvim-autopairs').setup()

require('oil').setup({
    view_options = {
        show_hidden = true,
        is_hidden_file = function(name, _)
            return vim.startswith(name, '.')
        end
    }
})

local cmp = require('blink.cmp')
cmp.build():wait(60000)
cmp.setup({
    completion = {
        menu = {
            border = 'rounded',
            draw = {
                columns = {
                    { 'label', 'label_description', gap = 1 },
                    { 'kind_icon', 'kind', gap = 1 }
                }
            }
        },
        documentation = { window = { border = 'rounded' } },
        ghost_text = { enabled = true }
    },
    signature = { window = { border = 'rounded' } }
})

local ts = require('nvim-treesitter')
ts.setup()
ts.install({ 'vim', 'vimdoc', 'lua', 'cpp', 'c_sharp' })

local wk = require('which-key')
wk.setup({
    win = {
        border = 'rounded',
        padding = { 1, 2 }
    }
})

-- indent-blankline.nvim
require('ibl').setup({
    indent = {
        char = '▏'
    }
})

vim.o.completeopt = 'menu,menuone,noselect'

