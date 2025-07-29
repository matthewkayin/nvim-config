return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp'
    },
    config = function()
        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(mode, keys, func, { desc = 'LSP:' .. desc })
                end

                map('<leader>r', vim.lsp.buf.rename, '[R]e[n]ame')
                map('<leader>ca', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
                map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
                map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
                map('gt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
                map('<leader>e', function()
                    vim.diagnostic.open_float(nil, { focusable = false , scope = 'line', max_width = 80, border = 'single'})
                end, 'View [E]rror')
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
