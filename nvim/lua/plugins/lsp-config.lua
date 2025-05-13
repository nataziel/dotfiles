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
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.rust_analyzer.setup({
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
                capabilities = capabilities,
            })

            lspconfig.pyright.setup({
                settings = {
                    pyright = {
                        -- Use ruff's import organiser
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            -- Ignore all files for analysis to exclusively use Ruff for linting
                            ignore = { "*" },
                        },
                    },
                },
                capabilities = capabilities,
            })

            -- ruff config
            local on_attach = function(client, bufnr)
                if client.name == "ruff" then
                    -- disable hover in favor of pyright
                    client.server_capabilities.hoverProvider = false
                end
            end

            lspconfig.ruff.setup({
                -- init_options = {},
                settings = {
                    args = { "--line-length 100" },
                },
                on_attach = on_attach,
                capabilities = capabilities,
            })

            lspconfig.gopls.setup({
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                    },
                },
                capabilities = capabilities,
            })

            lspconfig.golangci_lint_ls.setup({
                init_options = {
                    command = {
                        "golangci-lint",
                        "run",
                        "--output.json.path=stdout",
                        "--show-stats=false",
                        "--issues-exit-code=1",
                    },
                },
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to Definition" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
            vim.keymap.set({ "n", "v" }, "<leader>rs", vim.lsp.buf.rename, { desc = "LSP: Rename Symbol" })
        end,
    },
    {
        -- automatically configure lua_ls to import type defs
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {}
    },
}
