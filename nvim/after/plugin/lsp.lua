
require('mason').setup()
require('mason-lspconfig').setup()

-- LSP (C++)
vim.lsp.config('clangd', {
    cmd = {
        'clangd',
        '--background-index',
        '--clang-tidy',
        '--compile-commands-dir=build',
        '--experimental-modules-support'
    },
    init_options = {
        fallbackFlags = { '--std=c++26' }
    }
})

-- Enable clangd manually as it is not installed through Mason.
vim.lsp.enable('clangd')

-- LSP (Lua)
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

