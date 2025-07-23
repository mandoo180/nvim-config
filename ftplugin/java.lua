local jdtls = require('jdtls')
local data_dir = vim.fn.stdpath("data")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- local workspace_dir = "/home/douzone/Projects/" .. project_name
-- local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
local workspace_dir = data_dir .. "/jdtls-workspaces/" .. project_name
local system_types = {
  Linux = "linux",
  Darwin = "mac",
  Windows = "win",
  Windows_NT = "win",
}
local system_type = system_types[vim.loop.os_uname().sysname]
local java_home = os.getenv("JAVA_HOME")
local java = java_home and java_home .. "/bin/java" or "java"
local jdtls_config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    java,
    -- "java", -- or '/path/to/java17_or_newer/bin/java'
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
    vim.fn.stdpath("data") .. "/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar",
    "-configuration",
    vim.fn.stdpath("data") .. "/jdtls/config_" .. system_type,
    "-data",
    workspace_dir,
  },
  settings = {
    java = {
      signatureHelp = { enabled = true, },
      contentProvider = { preferred = 'fernflower' },
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
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  init_options = {
    bundles = {
      -- vim.fn.glob(os.getenv("HOME") .. "/Projects/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.2.jar"),
      vim.fn.stdpath("data") ..
      "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.2.jar",
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
        type = "java",
        request = "attach",
        name = "Attach to Running App",
        hostName = "127.0.0.1",
        port = 1044,
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
