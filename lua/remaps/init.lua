local M = {}

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>wv", vim.cmd.Ex)

vim.opt.clipboard = "unnamedplus"
vim.keymap.set("v", "<leader><s-y>", "\"+y", { noremap = true, silent = true }) -- Copy to system clipboard
vim.keymap.set("n", "<leader><s-p>", "\"+p", { noremap = true, silent = true }) -- Paste from system clipboard

vim.keymap.set("n", "<leader>n", vim.cmd.bNext)
vim.keymap.set("n", "<leader>p", vim.cmd.bprevious)
vim.keymap.set("n", "<leader>xx", function()
    vim.cmd("bd!")
end)

vim.keymap.set("n", "<leader>tt", vim.cmd.terminal)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })

-- Navigate left and right in Insert mode
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-l>', '<Right>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')

vim.keymap.set('n', '<A-s>s', '<C-w>w')

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action (LSP)' })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return M
