return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim",
	},
    opts = {
        close_if_last_window = true,
        filesystem = {
            hijack_netrw_behavior = "disabled",
        }
    },
    keys = {
        { "<C-n>", ":Neotree filesystem reveal left toggle=true<CR>",  desc = "Toggle Neotree" },
        { "<leader>nn", ":Neotree filesystem focus<CR>",  desc = "Focus Neotree" },

    },
}
