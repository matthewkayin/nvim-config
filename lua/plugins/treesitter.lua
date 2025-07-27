return {
    'nvim-treesitter/nvim-treesitter',
    depdendencies = {
        'nvim-treesitter/nvim-treesitter-textobjects'
    },
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { 'c', 'cpp', 'lua', 'json' },
            auto_install = true,
            highlight = { enable = true },
        }
    end
}
