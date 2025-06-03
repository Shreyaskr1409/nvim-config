return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function ()
        vim.keymap.set("n", "<space>fm", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
    end
}
