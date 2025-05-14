return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = "catppuccin",
        },
        extensions = {
            "neo-tree",
            "lazy",
            "mason",
            "trouble",
        },
        sections = {
            lualine_c = {
                "filename",
                function()
                    return require("nvim-treesitter").statusline({
                        indicator_size = 70,
                        type_patterns = { "class", "function", "method" },
                        separator = "->",
                    })
                end,
            },
        },
    },
}
