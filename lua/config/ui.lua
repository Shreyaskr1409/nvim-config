local M = {}

vim.cmd([[colorscheme kanagawa-dragon]])
-- vim.cmd([[colorscheme kanagawa-paper-ink]])
-- vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.cursorline = true

vim.opt.tabstop = 4        -- Number of spaces that a tab counts for
vim.opt.shiftwidth = 4     -- Number of spaces to use for auto-indentation
vim.opt.softtabstop = 4    -- Backspace works properly when pressing Tab
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true  -- Copy indent from current line when starting a new one

vim.opt.scrolloff = 8       -- Start vertical scrolling 8 lines before the edge
vim.opt.sidescrolloff = 8   -- Start horizontal scrolling 8 columns before the edge

return M
