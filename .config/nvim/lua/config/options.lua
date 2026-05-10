
vim.cmd.colorscheme('tokyonight-night')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.clipboard = 'unnamedplus'

vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = 'yes'

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = false
vim.o.expandtab = true

vim.o.updatetime = 300

vim.o.termguicolors = true

-- Show which line your cursor is on
vim.o.cursorline = true
vim.o.cursorlineopt = 'number'

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true

-- Diagnostic config & keymaps
vim.diagnostic.config({
    update_in_insert = false,
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = { min = vim.diagnostic.severity.WARN } },

    -- Choose where to show diagnostic messages
    virtual_text = true, -- Text shows up at the ond of the line
    virtual_lines = false, -- Text shows underneath the line, as a virtual line

    -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
    jump = {
        on_jump = function(_, bufnr)
            vim.diagnostic.open_float {
                bufnr = bufnr,
                scope = 'cursor',
                focus = false
            }
        end
    }
})

