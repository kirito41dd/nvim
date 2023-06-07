return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require("bufferline").setup { -- :h bufferline-configuration
			options = {
				diagnostics = "nvim_lsp",
				-- 给nvim tree让出位置
				offsets = { {
					filetype = "NvimTree",
					text = "File Expolorer",
					highlight = "Directory",
					text_align = "left"
				} }
			}
		}
	end,
}
