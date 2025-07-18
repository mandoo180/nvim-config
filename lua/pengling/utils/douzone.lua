-- Function to copy a file to a target directory
local function copy_file_to_dir(target_dir)
  -- Default to the current file if filepath is nil or empty
  local source = vim.fn.expand("%:p")
  target_dir = vim.fn.expand(target_dir)
  -- Check if target directory exists
  if vim.fn.isdirectory(target_dir) == 0 then
    vim.api.nvim_err_writeln("Target directory does not exist: " .. target_dir)
    return
  end
  -- Build target file path
  local filename = vim.fn.fnamemodify(source, ":t")
  local target_path = target_dir .. "/" .. filename
  -- Copy the file
  local cmd = { "cp", source, target_path }
  local result = vim.fn.system(cmd)
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_err_writeln("Failed to copy file: " .. result)
  else
    vim.api.nvim_out_write("Copied " .. source .. " to " .. target_path .. "\n")
  end
end

local dews_repo = os.getenv("HOME") .. "/Projects/douzone-comet-webapp-boot/dews-web/repository/view"
local dews_html = dews_repo .. "/html/HR"
local dews_js = dews_repo .. "/js/HR"
local dews_css = dews_repo .. "/css/HR"
vim.keymap.set("n", "<leader>ch", function() copy_file_to_dir(dews_html) end, { desc = "Copy current file to dews html directory." })
vim.keymap.set("n", "<leader>cj", function() copy_file_to_dir(dews_js) end, { desc = "Copy current file to dews js directory." })
vim.keymap.set("n", "<leader>cc", function() copy_file_to_dir(dews_css) end, { desc = "Copy current file to dews css directory." })
