return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    lazy = true,
    config = function()
      require("lsp_lines").setup()
      -- Disable virtual_text (default diagnostics) to avoid overlap
      -- vim.diagnostic.config({ virtual_text = false })
    end,
  },
}
