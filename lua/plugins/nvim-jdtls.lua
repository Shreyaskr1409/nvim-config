return {
    'mfussenegger/nvim-jdtls',
    ft = { "java" },
    config = function()
        local jdtls = require('jdtls')

        -- Helper function to normalize paths for Windows
        local function normalize_path(path)
            return path:gsub("\\", "/")
        end

        -- Mason JDTLS installation paths
        local mason_path = normalize_path(vim.fn.stdpath("data") .. "/mason/packages/jdtls")
        local workspace_path = normalize_path(vim.fn.stdpath("cache") .. "/jdtls")
        local workspace_dir = workspace_path .. "/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

        -- Create workspace directory if it doesn't exist
        vim.fn.mkdir(workspace_dir, "p")

        -- Find the launcher jar using glob pattern
        local launcher_pattern = normalize_path(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
        local launcher_jar = vim.fn.glob(launcher_pattern)

        if launcher_jar == "" then
            vim.notify("JDTLS launcher JAR not found. Please ensure JDTLS is installed via Mason.", vim.log.levels.ERROR)
            return
        end

        -- Configuration directory based on OS
        local config_dir = mason_path .. (vim.fn.has('win32') == 1 and "/config_win" or "/config_linux")

        -- Validate config directory exists
        if vim.fn.isdirectory(config_dir) == 0 then
            vim.notify("JDTLS config directory not found: " .. config_dir, vim.log.levels.ERROR)
            return
        end

        -- JDTLS configuration
        local config = {
            cmd = {
                "java",
                "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                "-Dosgi.bundles.defaultStartLevel=4",
                "-Declipse.product=org.eclipse.jdt.ls.core.product",
                "-Dlog.protocol=true",
                "-Dlog.level=ALL",
                "-Xmx1g",
                "--add-modules=ALL-SYSTEM",
                "--add-opens", "java.base/java.util=ALL-UNNAMED",
                "--add-opens", "java.base/java.lang=ALL-UNNAMED",
                "-jar", launcher_jar,
                "-configuration", config_dir,
                "-data", workspace_dir,
            },

            -- Root directory detection
            root_dir = require("jdtls.setup").find_root({
                -- Common project identifiers
                ".git",
                "mvnw",
                "gradlew",
                "pom.xml",
                "build.gradle",
            }),

            -- Java settings
            settings = {
                java = {
                    configuration = {
                        updateBuildConfiguration = "interactive",
                    },
                    maven = {
                        downloadSources = true,
                    },
                    implementationsCodeLens = {
                        enabled = true,
                    },
                    referencesCodeLens = {
                        enabled = true,
                    },
                    format = {
                        enabled = true,
                    },
                },
            },

            init_options = {
                bundles = {},
            },
        }

        -- Attach JDTLS
        jdtls.start_or_attach(config)
    end
}
