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

lspconfig.svelte.setup({
  on_attach = function(client, bufnr)
    -- Optional: format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end,
})

lspconfig.ts_ls.setup{}
lspconfig.tailwindcss.setup{}

lspconfig.clangd.setup{
  cmd = {
    "clangd",
    "--background-index",
    "--header-insertion=iwyu",
    "--cross-file-rename",
    "--clang-tidy"
  },
  init_options = {
    fallbackFlags = {
    }
  }
}
if vim.fn.has('win32') == 1 then
  local username = os.getenv("USERNAME")
  if username then -- Check if USERNAME env var exists
    table.insert(lspconfig.clangd.init_options.fallbackFlags,
      "-IC:/Users/" .. username .. "/scoop/apps/cygwin/2.934/root/usr/include"
    )
  else
    -- Optional: print a warning if USERNAME is not found on Windows
    print("Warning: USERNAME environment variable not found. Cygwin include path might be incomplete.")
  end
end

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-h>'] = cmp.mapping.select_prev_item(),
    ['<C-l>'] = cmp.mapping.select_next_item(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }
})

cmp.config.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter
}
