return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = function(term)
					if term.direction == "horizontal" then
						return 15
					elseif term.direction == "vertical" then
						return vim.o.columns * 0.4
					end
				end,
				highlights = {
					Normal = {
						link = "Normal",
					},
					NormalFloat = {
						link = "Normal",
					},
					FloatBorder = {
						link = "FloatBorder",
					},
					SignColumn = {
						link = "EndOfBuffer",
					},
					EndOfBuffer = {
						link = "EndOfBuffer",
					},
				},
				float_opts = {
					border = "rounded",
				},
				persist_size = true,
				persist_mode = true,
				autochdir = true,
			})
		end,
	},
}
