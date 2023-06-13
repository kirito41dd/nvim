require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "rust_analyzer", "gopls", "lua_ls" }
})
require("mason-nvim-dap").setup({
	ensure_installed = { "delve" } -- delve for golang
})

local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers {
	function(server_name)
		require("lspconfig")[server_name].setup {}
	end,
	["rust_analyzer"] = function()
		require("rust-tools").setup {
			tools = {
				-- rust-tools options
				inlay_hints = {
					auto = true,
				},
				hover_actions = {
					auto_focus = true
				},
			},

			-- all the opts to send to nvim-lspconfig
			server = {
				on_attach = function(_, bufnr)
					require("keymap").rust_tools(require("rust-tools"), bufnr)
				end,
				settings = {
					["rust-analyzer"] = {
						--
					}
				}

			}
		}
	end,
	["gopls"] = function()
		lspconfig.gopls.setup {
			cmd = { "gopls", "serve" },
			filetypes = { "go", "gomod" },
			root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
				},
			},
		}
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
