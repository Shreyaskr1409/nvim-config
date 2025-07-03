return {
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function ()
            require("kanagawa").setup({
                transparent = false
            })
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
    },
    {
        "rose-pine/nvim",
        name = "rose-pine",
        priority = 1000,
        config = function ()
            require("rose-pine").setup({
                styles = {
                    bold = false,
                    italic = false,
                    transparency = true,
                },
            })
        end
    },
    {
        "xero/miasma.nvim",
        name = "miasma",
        priority = 1000,
    },
    {
        "thesimonho/kanagawa-paper.nvim",
        priority = 1000,
        config = function ()
            require("kanagawa-paper").setup({
                transparent = false,
                gutter = true,
            })
        end
    },
    {
        "gmr458/cold.nvim",
        priority = 1000,
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
        name = "oxycarbon",
        priority = 1000,
    },
    {
      "vague2k/vague.nvim",
      config = function()
        -- NOTE: you do not need to call setup if you don't want to.
        require("vague").setup({
            transparent = false,
        })
      end
    },
    {
        "zenbones-theme/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        -- you can set set configuration options here
        -- config = function()
        --     vim.g.zenbones_darken_comments = 45
        --     vim.cmd.colorscheme('zenbones')
        -- end
    },
}
