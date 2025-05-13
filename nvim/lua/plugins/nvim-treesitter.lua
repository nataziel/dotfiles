return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "python",
                "toml",
                "yaml",
                "markdown",
                "bash",
                "go",
                "sql",
                "rust",
                "json",
                "javascript",
            },
            sync_install = true,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            textobjects = { enable = true },
        })
    end,
}
