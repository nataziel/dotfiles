return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.markdownlint,
                null_ls.builtins.formatting.gofmt,
            },
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "format file with lsp attached to the buffer" })
    end,
}
