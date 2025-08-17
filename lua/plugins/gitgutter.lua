return {
    'airblade/vim-gitgutter',
    config = function()
        vim.g.gitgutter_enabled = 1
        vim.g.gitgutter_autoupdate = 1

        vim.g.gitgutter_sign_added = "+"
        vim.g.gitgutter_sign_modified = "~"
        vim.g.gitgutter_sign_removed = "-"

        -- Set keybindings for hunk navigation
        vim.api.nvim_set_keymap("n", "]c", "<Plug>(GitGutterNextHunk)", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("n", "[c", "<Plug>(GitGutterPrevHunk)", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>gb", ":GitGutterToggle <CR>", { noremap = false, silent = true })
        vim.cmd(':GitGutterLineHighlightsEnable')
    end
    -- 'lweis6991/gitsigns.nvim',
}
