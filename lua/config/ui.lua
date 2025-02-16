local M = {}

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

vim.opt.tabstop = 4        -- Number of spaces that a tab counts for
vim.opt.shiftwidth = 4     -- Number of spaces to use for auto-indentation
vim.opt.softtabstop = 4    -- Backspace works properly when pressing Tab
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true  -- Copy indent from current line when starting a new one

return M
