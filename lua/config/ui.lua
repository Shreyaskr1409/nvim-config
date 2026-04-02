local M = {}

vim.cmd([[colorscheme kanagawa-dragon]])
vim.api.nvim_set_hl(0, "Normal", { bg = "#111111" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#555555", bg = "#1a1a1a" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FF5D62", bg = "#1a1a1a" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1a1a" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1a1a1a" })
vim.cmd.highlight('MsgArea guibg=#181616')

-- vim.cmd([[colorscheme kanagawa-paper]])

vim.opt.laststatus=3
vim.opt.showtabline=3

vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.numberwidth = 4
vim.opt.cursorline = true

vim.opt.tabstop = 4        -- Number of spaces that a tab counts for
vim.opt.shiftwidth = 4     -- Number of spaces to use for auto-indentation
vim.opt.softtabstop = 4    -- Backspace works properly when pressing Tab
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true  -- Copy indent from current line when starting a new one

vim.opt.scrolloff = 8       -- Start vertical scrolling 8 lines before the edge
vim.opt.sidescrolloff = 8   -- Start horizontal scrolling 8 columns before the edge

local transparent = false
local original_bg = nil

function ToggleTransparent()
    transparent = not transparent
    if transparent then
        original_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        print("Transparency ON")

        vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = original_bg })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = original_bg })
        vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = original_bg })

    else
        vim.api.nvim_set_hl(0, "Normal", { bg = original_bg })

        vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = original_bg })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = original_bg })
        vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = original_bg })

        print("Transparency OFF")
    end
end

vim.keymap.set("n", "<leader>ct", ToggleTransparent, { desc = "Toggle background transparency" })

return M
