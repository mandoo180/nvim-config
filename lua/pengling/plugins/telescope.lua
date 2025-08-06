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

