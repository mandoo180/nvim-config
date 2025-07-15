local jdtls = require('jdtls')
local data_dir = vim.fn.stdpath("data")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- local workspace_dir = "/home/douzone/Projects/" .. project_name
-- local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
local workspace_dir = data_dir .. "/jdtls-workspaces/" .. project_name
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
local jdtls_config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
        "java", -- or '/path/to/java17_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        data_dir .. "/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar",
        -- "/home/hydroakri/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.1.6.700.v20231214-2017.jar",
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
        -- Must point to the                                                     Change this to
        -- eclipse.jdt.ls installation                                           the actual version
        -- 💀
        "-configuration",
        data_dir .. "/jdtls/config_linux",
        -- "/home/hydroakri/.local/share/nvim/mason/packages/jdtls/config_linux",
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
        -- Must point to the                      Change to one of `linux`, `win` or `mac`
        -- eclipse.jdt.ls installation            Depending on your system.
        -- 💀
        -- See `data directory configuration` section in the README
        "-data",
        workspace_dir,
    },
    -- 💀
    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    -- root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {
            signatureHelp = { enabled = true, },
            contentProvider = { preferred = 'fernflower'},
            eclipse = {
                downloadSources = true,
            },
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
            references = {
                includeDecompiledSources = true,
            },
            format = {
                enabled = true,
            }
        },
    },
    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        bundles = {
            -- vim.fn.glob(os.getenv("HOME") .. "/Projects/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.2.jar"),
            os.getenv("HOME") .. "/Projects/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.2.jar",
        },
    },
    on_attach = function(client, bufnr)
        -- require('me.lsp.conf').on_attach(client, bufnr, {
        --     server_side_fuzzy_completion = true,
        -- })
        local dap = require('dap')
        dap.set_log_level("DEBUG")
        dap.configurations.java = {
            {
                type = "java";
                request = "attach";
                name = "Attach to Running App";
                hostName = "127.0.0.1";
                port = 5005;
            },
        }
        -- dap.adapters.java = function(callback)
        --     callback({
        --         type = "server";
        --         host = "127.0.0.1";
        --         port = 5005;
        --     })
        -- end
        jdtls.setup_dap({ hotcodereplace = 'auto' })
        jdtls.setup.add_commands()
        local opts = { silent = true, buffer = bufnr }
        vim.keymap.set('n', "<M-o>", jdtls.organize_imports, opts)
        -- vim.keymap.set('n', "<leader>df", jdtls.test_class, opts)
        -- vim.keymap.set('n', "<leader>dn", jdtls.test_nearest_method, opts)
        -- vim.keymap.set('n', "crv", jdtls.extract_variable, opts)
        -- vim.keymap.set('v', 'crm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], opts)
        -- vim.keymap.set('n', "crc", jdtls.extract_constant, opts)
        -- local create_command = vim.api.nvim_buf_create_user_command
        -- create_command(bufnr, 'W', require('me.lsp.ext').remove_unused_imports, {
        --     nargs = 0,
        -- })
    end
}
jdtls.start_or_attach(jdtls_config)
-- require('dap').configurations.java = {
--     {
--         type = "java",
--         request = "attach",
--         name = "Attach to Running App",
--         hostName = "127.0.0.1",
--         port = 1044,
--     },
-- }
-- jdtls.setup_dap({ hotcodereplace = 'auto' })
