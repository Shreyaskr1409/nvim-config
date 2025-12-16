return {

    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function ()
            require("kanagawa").setup({
                -- transparent = true,
                transparent = false,
            })
        end
    },

    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function ()
            vim.g.gruvbox_material_background = 'hard'
            vim.g.gruvbox_material_foreground = 'material'
            -- vim.g.gruvbox_material_transparent_background = '1'
            vim.g.gruvbox_material_better_performance = 1
        end
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
                    -- transparency = true,
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
                -- transparent = false,
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
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
    },

    {
        "anAcc22/sakura.nvim",
        dependencies = "rktjmp/lush.nvim",
        config = function()
            vim.opt.background = "dark" -- or "light"
            -- vim.cmd('colorscheme sakura') -- sets the colorscheme
        end
    }
}
