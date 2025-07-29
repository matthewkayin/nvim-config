-- General settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.cursorline = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Clippy
vim.opt.clipboard = "unnamedplus"

-- Mouse
vim.opt.mouse = "a"

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Keymaps
require("config.keymaps")

-- Lazy
require("config.lazy")

-- Code folding
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.api.nvim_create_autocmd({'BufReadPost','FileReadPost'}, {
    desc = 'Unfold code on file open',
    group = vim.api.nvim_create_augroup('unfold-on-file-open', { clear = true }),
    callback = function()
        vim.api.nvim_command('normal zR')
    end
})
