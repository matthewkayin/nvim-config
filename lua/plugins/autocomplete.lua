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
            cmp.setup({
                auto_brackets = {},
                completion = { completeopt = "menu,menuone,noinsert" },
                mapping = cmp.mapping.preset.insert {
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                    { name = 'buffer', option = { keyword_length = 3 }}
                },
                enabled = function()
                    local disabled = false
                    disabled = disabled or (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
                    disabled = disabled or (vim.fn.reg_recording() ~= ' ')
                    disabled = disabled or (vim.fn.reg_executing() ~= ' ')
                    disabled = disabled or require('cmp.config.context').in_treesitter_capture('comment')
                    return not disabled
                end,
            })
        end
    }
}
