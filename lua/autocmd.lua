--拷贝内容后自动高亮
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 300,
		})
	end,
})

--toggleterm终端窗口keymapping
vim.api.nvim_create_autocmd({ "TermOpen" }, {
	pattern = { "term://*" },
	callback = function()
		require("keymap").toggleterm()
	end
})
