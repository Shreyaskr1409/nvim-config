return {
    "nvim-tree/nvim-tree.lua",
    config = function ()
        require("nvim-tree").setup()
        require("config.nvim-tree")
        vim.keymap.set("n", "<leader>ft", ":NvimTreeToggle <CR>")
    end
}
