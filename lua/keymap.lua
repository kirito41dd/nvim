local opt = { noremap = true, silent = true }
vim.g.mapleader = ","
--在分割区域跳转
vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)
vim.keymap.set("n", "<C-l>", "<C-w>l", opt)
--分割
vim.keymap.set("n", "<Leader>v", "<C-w>v", opt)
vim.keymap.set("n", "<Leader>s", "<C-w>s", opt)
--智能gk gj 方便在自动换行的文本上移动
--https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })
--全选
vim.keymap.set("n", "<Leader>a", "ggVG", opt)
--lsp format
vim.keymap.set("n", "<Leader>=", ":lua vim.lsp.buf.format()<CR>", opt)
