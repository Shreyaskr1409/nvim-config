local M = {}

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>wv", vim.cmd.Ex)

vim.keymap.set("v", "<leader><s-y>", "\"+y", { noremap = true, silent = true }) -- Copy to system clipboard
vim.keymap.set("n", "<leader><s-p>", "\"+p", { noremap = true, silent = true }) -- Paste from system clipboard

vim.keymap.set("n", "<leader>n", vim.cmd.bNext)
vim.keymap.set("n", "<leader>p", vim.cmd.bprevious)
vim.keymap.set("n", "<leader>xx", vim.cmd.bdelete)

return M
