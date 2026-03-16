require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto', -- Uses the default colors of your colorscheme
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
    },

    sections = {
        -- lualine_a = {},
        -- lualine_b = {},
        -- lualine_c = {},
        -- lualine_x = {},
        -- lualine_y = {},
        -- lualine_z = {},
        lualine_a = {},
        lualine_b = {'mode'},
        lualine_c = {
            {
                'branch',
                color = { bg = "181616" }
            },
            'diff',
            'diagnostics'
        },
        lualine_x = {'filetype', 'lsp_progress', 'treesitter'},
        lualine_y = {'tabs'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        -- lualine_a = {'mode'},
        -- lualine_b = {'branch', 'diff', 'diagnostics'},
        -- lualine_c = {'buffers'},
        -- lualine_x = {'filetype', 'lsp_progress', 'treesitter'},
        -- lualine_y = {'tabs'},
        -- lualine_z = {'location'},
        lualine_a = {'buffers'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },

    -- sections = {
    --     lualine_a = {},
    --     lualine_b = {},
    --     lualine_c = {},
    --     lualine_x = {},
    --     lualine_y = {},
    --     lualine_z = {},
    -- },
    -- inactive_sections = {
    --     lualine_a = {},
    --     lualine_b = {},
    --     lualine_c = {},
    --     lualine_x = {},
    --     lualine_y = {},
    --     lualine_z = {}
    -- },
    -- tabline = {
    --     lualine_a = {'mode'},
    --     lualine_b = {'buffers'},
    --     lualine_c = {},
    --     lualine_x = {'diff', 'diagnostics'},
    --     lualine_y = {'filetype', 'lsp_progress', 'treesitter'},
    --     lualine_z = {'branch'},
    -- },

    extensions = {}
}
