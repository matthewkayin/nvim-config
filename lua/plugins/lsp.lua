return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp'
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(mode, keys, func, { desc = 'LSP:' .. desc })
                end

                map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
                map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
                map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
                map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
                map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
                map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
            end -- end callback
        })
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('lspconfig').clangd.setup {
            capabilities = capabilities,
            cmd = { "clangd", "--compile-commands-dir=build" },
            root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
        }
    end, -- end config function
}
