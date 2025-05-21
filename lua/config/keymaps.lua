-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set(
  "n",
  "<leader>sf",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { noremap = true, silent = true, desc = "Replace word under cursor" }
)
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>cp", function()
  local path = vim.fn.expand("%:p"):match("src/.*")
  if path then
    vim.fn.setreg("+", path)
    vim.notify("Copied: " .. path)
  else
    vim.notify('No "src/" in path', vim.log.levels.WARN)
  end
end, { desc = "Copy path from src/" })
