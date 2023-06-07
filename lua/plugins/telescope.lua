return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			{ "<leader>ff", ":Telescope find_files<CR>",  desc = "Telescope find files" },
			{ "<leader>fg", ":Telescope live_grep<CR>",   desc = "Telescope live grep" },
			{ "<leader>fb", ":Telescope buffers<CR>",     desc = "Telescope buffers" },
			{ "<leader>fs", ":Telescope grep_string<CR>", desc = "Telescope grep string" },
			{ "<leader>fh", ":Telescope help_tags<CR>",   desc = "Telescope help tags" },
		}
	}
}
