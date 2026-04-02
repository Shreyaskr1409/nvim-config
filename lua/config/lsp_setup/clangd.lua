local function setupNormalClangd()
    local lspconfig = require("lspconfig")

    local project_root = vim.fn.getcwd()
    local clangd_cmd = vim.env.CLANGD_PATH or "clangd"

    lspconfig.clangd.setup({
        cmd = {
            clangd_cmd,
            "--background-index",
            "--header-insertion=iwyu",
            "--clang-tidy",
            "--query-driver=/usr/bin/gcc",  -- Tell clangd to use GCC
            "--fallback-style=gnu",         -- Use GCC-style formatting
        },
        init_options = {
            fallbackFlags = {
                -- GCC system includes (replace with your paths from `gcc -v`)
                "-I/usr/lib/gcc/x86_64-linux-gnu/11/include",
                "-I/usr/include/x86_64-linux-gnu",
                "-I/usr/include",
                "-I/usr/local/include",

                -- Project-specific includes (adjust as needed)
                "-I" .. project_root .. "/include",
                "-I" .. project_root .. "/lib",
                "-I" .. project_root .. "/src",

                -- Library paths (if needed)
                "-L/usr/lib",
                "-L/usr/local/lib",
                "-L" .. project_root .. "/lib",

                "-x", "c",
                "-std=gnu11",
            },
        },
        root_dir = lspconfig.util.root_pattern(".git"),
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp", "h" },
    })
end



local function setupEsp32Clangd()
    local lspconfig = require("lspconfig")
    local esp32     = require("esp32")

    local base_cfg = esp32.lsp_config()

    lspconfig.clangd.setup(base_cfg)
end

local use_esp32_clangd = false

local function setupClangd()
    if use_esp32_clangd then
        setupEsp32Clangd()
    else
        setupNormalClangd()
    end
end

setupClangd()

vim.api.nvim_create_user_command("ToggleEsp32Lsp", function()
    use_esp32_clangd = not use_esp32_clangd
    vim.notify("ESP32 clangd: " .. (use_esp32_clangd and "ENABLED" or "DISABLED"))
    vim.lsp.stop_client(vim.lsp.get_clients({ bufnr = 0 }))
    setupClangd()
end, {})
