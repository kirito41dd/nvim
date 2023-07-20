local set = vim.o

set.number = true         --行号
set.clipboard = "unnamed" --剪切板和系统打通
--set.tablestop = 4         --tab长度
--set.shiftwidth = 4        --自动缩进的长度
--set.autoindent = true
set.splitbelow = true -- 控制默认的分屏方向
set.splitright = true
--treesister 折叠
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false
if vim.loop.os_uname().sysname == "Windows_NT" then
	set.shellcmdflag = "--login -i -c"
end

require("autocmd")
require("keymap").setup()

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

-- 只在gui启用主题
if vim.g.neovide then
	-- vim.cmd.colorscheme("hardhacker")
	-- vim.cmd.colorscheme("catppuccin-latte")
	vim.o.title = true
	vim.o.background = "light"
	vim.cmd.colorscheme("one-nvim")
	require("keymap").neovide()
end

require("lsp-setup")
require("debugging")
