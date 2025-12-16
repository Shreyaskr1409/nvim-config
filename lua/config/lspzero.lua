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

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        local clients = vim.lsp.get_active_clients({ bufnr = 0 })
        for _, client in ipairs(clients) do
            if client.name == "gopls" then
                vim.lsp.buf.format({ async = false })
                return
            end
        end
    end,
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
lspconfig.sqls.setup{}
lspconfig.pylsp.setup{}
lspconfig.tinymist.setup{}

lspconfig.ltex.setup({
  cmd = { "ltex-ls-plus" },
  filetypes = { "markdown", "text", "latex" },
  settings = {
    ltex = {
      language = "en",
      additionalRules = { languageModel = "~/models/ngrams/" },
    },
  },
})

local project_root = vim.fn.getcwd()  -- Get project root

lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--header-insertion=iwyu",
    "--clang-tidy",
    "--query-driver=/usr/bin/gcc",  -- Tell clangd to use GCC
    "--fallback-style=gnu",         -- Use GCC-style formatting
  },
  init_options = {
    fallbackFlags = {
      -- GCC system includes (replace with your paths from `gcc -v`)
      "-I/usr/lib/gcc/x86_64-linux-gnu/11/include",
      "-I/usr/include/x86_64-linux-gnu",
      "-I/usr/include",
      "-I/usr/local/include",

      -- Project-specific includes (adjust as needed)
      "-I" .. project_root .. "/include",
      "-I" .. project_root .. "/lib",
      "-I" .. project_root .. "/src",

      -- Library paths (if needed)
      "-L/usr/lib",
      "-L/usr/local/lib",
      "-L" .. project_root .. "/lib",
    },
  },
})

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered({
        max_width = 20,
        max_height = 10,
    }),
    documentation = cmp.config.window.bordered({
        max_width = 20,
        max_height = 10,
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-h>'] = cmp.mapping.select_prev_item(),
    ['<C-l>'] = cmp.mapping.select_next_item(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      elseif require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()
      else
        fallback()
      end
    end, {'i', 's'}),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = "buffer" },
    { name = "path" },
  }
})

cmp.config.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter
}
