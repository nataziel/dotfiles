return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup{
            highlights=require("catppuccin.groups.integrations.bufferline").get()
        }
	end,
}
