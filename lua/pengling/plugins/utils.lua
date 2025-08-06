-- pairs
require "mini.pairs".setup {}

-- leap
require "leap".set_default_mappings()

-- Neotree
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>1", "<Cmd>Neotree reveal<CR>")
