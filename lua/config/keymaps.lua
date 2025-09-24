local k = vim.keymap
opts = {
  silent = true,
  noremap = true,
}
k.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
k.set("n", "<leader>t", ":CompetiTest run<CR>", opts)
k.set("n", "<C-h>", "<C-w>h", opts)
k.set("n", "<C-j>", "<C-w>j", opts)
k.set("n", "<C-k>", "<C-w>k", opts)
k.set("n", "<C-l>", "<C-w>l", opts)

