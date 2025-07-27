return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup {
                auto_brackets = {},
                completion = { completeopt = "menu,menuone,noinsert" },
                mapping = cmp.mapping.preset.insert {
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                    { name = 'buffer', option = { keyword_length = 3 }}
                }
            }
        end
    }
}
