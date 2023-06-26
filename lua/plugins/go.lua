return {
	"fatih/vim-go",
	--"ray-x/go.nvim",
	--	dependencies = { -- optional packages
	--		"ray-x/guihua.lua",
	--		"neovim/nvim-lspconfig",
	--		"nvim-treesitter/nvim-treesitter",
	--	},
	--	config = function()
	--		require("go").setup {
	--			dap_debug_keymap = false,
	--			icons = false,
	--			lsp_keymaps = false,
	--		}
	--	end,
	--	event = { "CmdlineEnter" },
	--	ft = { "go", 'gomod' },
	--	build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
	build = ':GoInstallBinaries' -- if you need to install/update all binaries
}
