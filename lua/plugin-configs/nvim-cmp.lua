local cmp = require('cmp')

vim.cmd('set completeopt=menu,menuone,noselect')

cmp.setup({
    preselect = { cmp.PreselectMode.None },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>']     =       cmp.mapping.scroll_docs(-4),
        ['<C-f>']     =       cmp.mapping.scroll_docs(4),
        ['<Tab>']     =       cmp.mapping.select_next_item(),
        ['<S-Tab>']   =       cmp.mapping.select_prev_item(),
        ['<C-j>']     =       cmp.mapping.select_next_item(),
        ['<C-k>']     =       cmp.mapping.select_prev_item(),
        ['<CR>']      =       cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] =       cmp.mapping.complete(),
        ['<C-e>']     =       cmp.mapping.abort(),
        ['<Esc>']     =       cmp.mapping.abort(),
    }),

    sources = cmp.config.sources(
    {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path'}
    },
    {
      { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources(
    {
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    },
    {
      { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
    {
      { name = 'path' }
    },
    {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig').clangd.setup({
    capabilities = capabilities
})

require('lspconfig').tsserver.setup({
    capabilities = capabilities
})

require('lspconfig').lua_ls.setup({
    capabilities = capabilities
})

require('lspconfig').html.setup({
    capabilities = capabilities
})

require('lspconfig').cssls.setup({
    capabilities = capabilities
})

require('lspconfig').docker_compose_language_service.setup({
    capabilities = capabilities
})

require('lspconfig').dockerls.setup({
    capabilities = capabilities
})

require('lspconfig').gopls.setup({
    capabilities = capabilities
})

require('lspconfig').rust_analyzer.setup({
    capabilities = capabilities,
    filetypes = {"rust"}
})

require('lspconfig').emmet_language_server.setup({
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {"javascript", "tsserver"},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
})

require('luasnip').filetype_extend("javascript", { "javascriptreact" })
require('luasnip').filetype_extend("javascript", { "html" })
