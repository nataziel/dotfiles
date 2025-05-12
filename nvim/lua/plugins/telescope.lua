return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope: Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: grep text" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc='Telescope: list buffers'})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {desc = 'Telescope: help tags'})
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {desc = 'Telescope: lsp diagnostics'})
			vim.keymap.set("n", "<leader>fi", builtin.diagnostics, {desc = 'Telescope: lsp incoming'})
			vim.keymap.set("n", "<leader>fo", builtin.diagnostics, {desc = 'Telescope: lsp outgoing'})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		event = "Vimenter",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
