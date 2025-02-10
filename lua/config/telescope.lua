local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("GREP > ") });
end)

-- ALTERNATIVE MAPPINGS FOR TELESCOPE
vim.keymap.set('n', '<leader>l', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>l', builtin.find_files, { desc = 'Telescope find files' })
