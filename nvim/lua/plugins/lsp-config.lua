return {
    {
        "mason-org/mason.nvim",
        config = true, -- needed to ensure lazy calls .setup({}) when opts not set
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = false,
            ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "ruff", "gopls", "golangci_lint_ls" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim", "saghen/blink.cmp" },
        config = function()
            -- lua_ls
            vim.lsp.enable("lua_ls")

            -- rust_analyzer
            vim.lsp.config("rust_analyzer", {
                on_attach = function()
                    vim.keymap.set("n", "<C-k>", function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                    end, {
                        desc = "LSP: Display inlay hints",
                    })
                end,
                settings = {
                    ["rust-analyzer"] = {
                        check = {
                            command = "clippy",
                        },
                        diagnostics = {
                            styleLints = {
                                enable = true,
                            },
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            })
            vim.lsp.enable("rust_analyzer")

            -- pyright
            vim.lsp.config("pyright", {
                settings = {
                    pyright = {
                        -- Using Ruff's import organiser
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            -- Ignore all files for analysis to exclusively use Ruff for linting
                            ignore = { "*" },
                        },
                    },
                },
            })
            vim.lsp.enable("pyright")

            -- ruff config
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client == nil then
                        return
                    end
                    if client.name == "ruff" then
                        -- Disable hover in favor of Pyright
                        client.server_capabilities.hoverProvider = false
                    end
                end,
                desc = "LSP: Disable hover capability from Ruff",
            })

            vim.lsp.enable("ruff")

            -- go
            vim.lsp.config("gopls", {
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                    },
                },
            })
            vim.lsp.enable("gopls")

            vim.lsp.enable("golangci_lint_ls")

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to Definition" })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
            vim.keymap.set({ "n", "v" }, "<leader>rs", vim.lsp.buf.rename, { desc = "LSP: Rename Symbol" })
            vim.keymap.set({ "n", "v" }, "grr", vim.lsp.buf.references, { desc = "LSP: References" })
        end,
    },
    {
        -- automatically configure lua_ls to import type defs
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },
}
