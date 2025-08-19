return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            integrations = {
                blink_cmp = true,
                flash = true,
                gitsigns = true,
                lsp_trouble = true,
                mason = true,
                neotree = true,
                -- nvim_lsp
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                        ok = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                        ok = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                nvim_surround = true,
                telescope = {
                    enabled = true,
                },
                treesitter = true,
                which_key = true,
            },
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
