return {
    "nvimdev/indentmini.nvim",
    config = function ()
        require("indentmini").setup()
        vim.cmd.highlight('IndentLine guifg=#300b1e')
        vim.cmd.highlight('IndentLineCurrent guifg=#70294D')
    end,
}
