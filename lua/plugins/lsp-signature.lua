return {
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",  -- Loads when LSP attaches
    opts = {
      bind = true,        -- Automatically bind to LSP
      handler_opts = {
        border = "rounded",  -- Rounded border for the signature window
      },
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
}
