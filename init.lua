local set = vim.o
set.number = true         --行号
set.clipboard = "unnamed" --剪切板和系统打通
set.tablestop = 4         --tab长度
set.shiftwidth = 4        --自动缩进的长度
require("autocmd")
require("keymap")

--lazy.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
--end lazy 确保leader key的设置(keymap)在lazy之前
vim.cmd.colorscheme("hardhacker")
require("lsp-setup")
