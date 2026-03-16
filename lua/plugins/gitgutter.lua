return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup {
            signs = {
                add          = { text = '▌' },
                change       = { text = '▌' },
                delete       = { text = '▌' },
                topdelete    = { text = '▌' },
                changedelete = { text = '▌' },
            },

            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                vim.keymap.set('n', ']c', gs.next_hunk, { buffer = bufnr })
                vim.keymap.set('n', '[c', gs.prev_hunk, { buffer = bufnr })
                vim.keymap.set('n', '<leader>gb', gs.toggle_signs, { buffer = bufnr })
            end,
        }
    end,
}

