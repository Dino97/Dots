
local ts = require("nvim-treesitter")

ts.setup({
    highlight = { enable = true },
    indent = { enable = true }
})

ts.install({
    'lua',
    'vim',
    'vimdoc',
    'c',
    'cpp',
    'c_sharp'
})

vim.api.nvim_create_autocmd('PackChanged', {
    callback = function()
        ts.update()
    end
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        local filetype = args.match
        local lang = vim.treesitter.language.get_lang(filetype)

        if lang and vim.treesitter.language.add(lang) then
            vim.bo.indentexpr = 'v:lua.require"nvim-treesitter".indentexpr()'
            vim.treesitter.start()
        end
    end
})

