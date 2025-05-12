return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            integrations = {
                flash = true,
                neotree = true,
                treesitter = true,
                mason = true,
                telescope = {
                    enabled = true,
                },
                lsp_trouble = true,
                which_key = true,
            },
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
