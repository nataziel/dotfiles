return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
        close_if_last_window = true,
        popup_border_style = "",
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
            },
            hijack_netrw_behavior = "disabled",
        },
    },
    keys = {
        { "<C-n>",      ":Neotree filesystem reveal left toggle=true<CR>", mode = { "n" }, desc = "Toggle Neotree" },
        { "<leader>nn", ":Neotree filesystem focus<CR>",                   mode = { "n" }, desc = "Focus Neotree" },
    },
}
