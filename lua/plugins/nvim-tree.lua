return {
    {"nvim-tree/nvim-web-devicons"},
    {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	config = function()
	    require("nvim-tree").setup {}
	end,
    }
}
