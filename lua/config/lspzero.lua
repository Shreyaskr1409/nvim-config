vim.opt.signcolumn = 'yes'

local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    local map = vim.keymap.set

    -- Navigation
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', 'gi', vim.lsp.buf.implementation, opts)
    map('n', 'go', vim.lsp.buf.type_definition, opts)
    map('n', 'gr', vim.lsp.buf.references, opts)
    
    -- Actions
    map('n', '<F2>', vim.lsp.buf.rename, opts)
    map({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({async = true}) end, opts)
    map('n', '<F4>', vim.lsp.buf.code_action, opts)
    map('n', 'gs', vim.lsp.buf.signature_help, opts)
  end
})

require('mason').setup()
-- require('mason-lspconfig').setup({
--   ensure_installed = {
--     'lua_ls',
--     'gopls',
--     'ts_ls',
--     'rust_analyzer',
--     'jdtls',
--     'tailwindcss',
--     'kotlin_language_server',
--     'svelte',
--     'svls',
--   }
-- })

local lspconfig = require('lspconfig')
lspconfig.gopls.setup({
    settings = {
        gopls = {
            gofumpt = true,
            staticcheck = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            }
        }
    }
})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = {
        globals = { 'vim', 'bit', 'describe', 'it', 'before_each', 'after_each' }
      }
    }
  }
})

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }
})
