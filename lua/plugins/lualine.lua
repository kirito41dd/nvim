return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", opt = true },
			{ "arkav/lualine-lsp-progress" }
		},
		config = function()
			require('lualine').setup {
				sections = {
					lualine_c = {
						'filename', 'lsp_progress'
					}
				}

			}
		end,
	}
}
