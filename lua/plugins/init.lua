return {

  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      require('onedark').load()
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'lualine'.setup {}
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8", -- or, branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup {
        defaults = {
          mappings = {
            i = {
              ["<C-g>"] = require("telescope.actions").close,
            },
            n = {
              ["<C-g>"] = require("telescope.actions").close,
            },
          },
        },
      }
      local builtin = require("telescope.builtin")
      -- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#neovim-lsp-pickers
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
      vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Find marks" })
      vim.keymap.set("n", "<leader>fp", builtin.registers, { desc = "Find registers" })
      vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find symbols" })
      vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "Find workspace's symbols" })
      vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Find references" })
      vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { desc = "Find implementations", })
      vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Find definitions", })
      vim.keymap.set("n", "<leader>ft", builtin.lsp_type_definitions, { desc = "Find type definitions", })
      vim.keymap.set("n", "<leader>fe", builtin.diagnostics, { desc = "Find errors(diagnostics)" })
      vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Find commands" })
    end,
  },

  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    config = function()
      require("mini.pairs").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = {
          "awk",
          "c",
          "clojure",
          "css",
          "csv",
          "desktop",
          "diff",
          "dockerfile",
          "git_config",
          "gitcommit",
          "gitignore",
          "go",
          "html",
          "htmldjango",
          "http",
          "ini",
          "java",
          "javascript",
          "jinja_inline",
          "jinja",
          "jq",
          "json",
          "kdl",
          "lua",
          "make",
          "markdown_inline",
          "markdown",
          "nginx",
          "perl",
          "python",
          "query",
          "ruby",
          "rust",
          "scheme",
          "sql",
          "ssh_config",
          "tmux",
          "toml",
          "tsv",
          "tsx",
          "typescript",
          "vim",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = false,
        -- List of parsers to ignore installing (or "all")
        -- ignore_install = { "javascript" },
        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
        highlight = {
          enable = true,
          -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
          -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
          -- the name of the parser)
          -- list of language that will be disabled
          -- disable = { "c", "rust" },
          -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require 'nvim-treesitter.configs'.setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,             -- automatically jump forward to textobj
            keymaps = {
              ["af"] = "@function.outer", -- around function
              ["if"] = "@function.inner", -- inside function
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      }
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },

  {
    -- git clone https://github.com/microsoft/java-debug.git
    "mfussenegger/nvim-dap",   -- Debug Adapter Protocol client
    dependencies = {
      "nvim-neotest/nvim-nio", -- 🆕 required for nvim-dap-ui
      "rcarriga/nvim-dap-ui",  -- UI for DAP
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      -- Setup UI
      dapui.setup()
      -- Automatically open UI on debug start
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      -- Close UI on debug end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      -- Key mappings for common DAP actions
      vim.keymap.set("n", "<F9>", dap.continue, { desc = "Continue Debugging" })
      vim.keymap.set("n", "<F8>", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<F7>", dap.step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<F11>", dap.step_out, { desc = "Step Out" })
      vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "Open Debug REPL" })
    end,
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({})
    end,
  },

  {
    "ggandor/leap.nvim",
    version = "*",
    dependencies = "tpope/vim-repeat",
    config = function()
      require("leap").set_default_mappings()
    end,
  },

  {
    -- https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
    "mattn/emmet-vim",
    ft = { "html", "css", "htmldjango", "eruby", "javascriptreact", "typescriptreact" },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                    -- neo-tree will lazily load itself
    config = function()
      vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")
      vim.keymap.set("n", "<leader>1", "<Cmd>Neotree reveal<CR>")
    end,
  },
}
