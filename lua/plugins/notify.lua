return {
    "rcarriga/nvim-notify",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    config = function ()
        require("notify").setup({
            background_colour = "#000000",
        })
    end
}
