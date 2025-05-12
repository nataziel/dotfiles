return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "lua",
                "vimdoc",
                "python",
                "toml",
                "yaml",
                "markdown",
                "vim",
                "bash",
                "go",
                "sql",
                "rust",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
