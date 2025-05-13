return {
    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")

            local custom_find = function()
                builtin.find_files({
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                    hidden = true,
                    no_ignore = true,
                })
            end
            vim.keymap.set("n", "<C-p>", custom_find, { desc = "Telescope: Find files" })

            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: grep text" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: list buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: help tags" })
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope: lsp diagnostics" })
            vim.keymap.set("n", "<leader>fi", builtin.lsp_incoming_calls, { desc = "Telescope: lsp incoming" })
            vim.keymap.set("n", "<leader>fo", builtin.lsp_outgoing_calls, { desc = "Telescope: lsp outgoing" })
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
