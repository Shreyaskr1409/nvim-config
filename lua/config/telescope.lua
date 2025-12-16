local telescope = require('telescope')
local builtin = require('telescope.builtin')

-- Configure Telescope with a fancy dropdown theme and ui-select extension
telescope.setup({
    defaults = {
        prompt_prefix = "Search: ",
        selection_caret = "->  ",
        path_display = { "truncate" },
        winblend = 00, -- Transparency
        border = true,
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        layout_config = {
            horizontal = {
                preview_width = 0.6,
            },
        },
        file_ignore_patterns = {
            "node_modules",
            ".git/",
            "old_ref",
            -- "include",
            -- "lib",
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- Add any specific options for ui-select if needed
            }
        }
    }
})

-- Load extensions
telescope.load_extension("ui-select")

-- Key mappings for Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fh', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("GREP > ") })
end, { desc = 'Telescope grep string' })

vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {desc = 'Telescope colorscheme'})

vim.keymap.set('n', '<leader>fD', builtin.lsp_document_symbols, { desc = 'Telescope document symbols' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope LSP diagnostics' })

vim.keymap.set('n', '<leader>fgs', builtin.git_status, { desc = 'Telescope git status' })
vim.keymap.set('n', '<leader>fgc', builtin.git_commits, { desc = 'Telescope git commits' })

vim.keymap.set('n', '<leader>fB', builtin.builtin, { desc = 'Telescope builtin' })






--------- FOLLOWING IS ONLY FOR OXOCARBON THEME ----------






-- Function to set Telescope colors for the Oxocarbon theme
local function set_telescope_oxocarbon_colors()
    local oxocarbon = {
        bg = "#161616",       -- Dark gray background
        border = "#78A9FF",   -- Blue for borders
        accent = "#FF7EB6",   -- Pink accent color
        selection = "#262626", -- Slightly lighter gray for selections
    }

    -- Set all relevant Telescope highlights with the chosen colors
    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = oxocarbon.border, bg = oxocarbon.bg })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = oxocarbon.bg })
    vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = oxocarbon.accent, bg = oxocarbon.selection })

    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = oxocarbon.selection })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = oxocarbon.border, bg = oxocarbon.selection })
    vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = oxocarbon.accent, bg = oxocarbon.selection })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = oxocarbon.bg, bg = oxocarbon.accent })

    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = oxocarbon.bg })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = oxocarbon.border, bg = oxocarbon.bg })
    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = oxocarbon.bg, bg = oxocarbon.border })

    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = oxocarbon.bg })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = oxocarbon.border, bg = oxocarbon.bg })
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = oxocarbon.bg, bg = oxocarbon.border })

    -- Float and border consistency
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = oxocarbon.border, bg = oxocarbon.bg })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = oxocarbon.bg })
end

-- Autocommand to apply colors only when the Oxocarbon theme is set
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "oxocarbon", -- Match exactly when the theme is oxocarbon
    callback = set_telescope_oxocarbon_colors,
})

-- Optional: Apply immediately if the theme is already active
if vim.g.colors_name == "oxocarbon" then
    set_telescope_oxocarbon_colors()
end
