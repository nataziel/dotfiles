return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.pairs").setup({})
        require("mini.surround").setup({})
        require("mini.notify").setup({})
        require("mini.cursorword").setup({})
        require("mini.comment").setup({
            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                -- Toggle comment (like `gcip` - comment inner paragraph) for both
                -- Normal and Visual modes
                comment = "<leader>/",

                -- Toggle comment on current line
                comment_line = "<C-_>",

                -- Toggle comment on visual selection
                comment_visual = "<C-_>",

                -- Define 'comment' textobject (like `dgc` - delete whole comment block)
                -- Works also in Visual mode if mapping differs from `comment_visual`
                textobject = "<leader>/",
            },
        })

        local spec_treesitter = require("mini.ai").gen_spec.treesitter
        require("mini.ai").setup({
            search_method = "cover_or_nearest",
            custom_textobjects = {
                A = spec_treesitter({ a = "@assignment.lhs", i = "@assignment.rhs" }),
            },
        })
    end,
}
