---@module 'lazy'
---@type LazySpec
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        branch = "main",
        lazy = false,
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        config = function()
            local treesitter = require("nvim-treesitter")
            treesitter.setup()
            local ensure_installed = {
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
                "dockerfile",
            }
            treesitter.install(ensure_installed)

            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
                        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                        vim.treesitter.start(args.buf)
                    end
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        init = function()
            vim.g.no_plugin_maps = true
        end,
        config = function()
            require("nvim-treesitter-textobjects").setup()
        end,
    },
}
