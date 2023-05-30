require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "rust_analyzer", "gopls", "lua_ls" }
})

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers {
	function(server_name)
		require("lspconfig")[server_name].setup {}
	end,
	["lua_ls"] = function()
		lspconfig.lua_ls.setup {
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = {
							vim.api.nvim_get_runtime_file("", true),
						},
					},
				}
			}
		}
	end
}
