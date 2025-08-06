require("nvim-treesitter.configs").setup({
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
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    disable = function(_, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
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
})
