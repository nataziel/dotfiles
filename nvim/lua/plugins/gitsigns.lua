return {
    "lewis6991/gitsigns.nvim",
    opts = {
        numhl = true,
        attach_to_untracked = true,
        current_line_blame = true,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
            delay = 500,
            ignore_whitespace = false,
            virt_text_priority = 10000, -- want it to show up after any diagnostics
            use_focus = true,
        },
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map("n", "]c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    gitsigns.nav_hunk("next")
                end
            end, { desc = "Gitsigns: Go to next hunk" })

            map("n", "[c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    gitsigns.nav_hunk("prev")
                end
            end, { desc = "Gitsigns: Go to previous hunk" })

            -- Actions
            map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Gitsigns: Stage hunk" })
            map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Gitsigns: Reset hunk" })

            map("v", "<leader>hs", function()
                gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, { desc = "Gitsigns: Stage hunk" })

            map("v", "<leader>hr", function()
                gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, { desc = "Gitsigns: Reset hunk" })

            map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Gitsigns: Stage buffer" })
            map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Gitsigns: Reset buffer" })
            map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Gitsigns: Preview hunk" })
            map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Gitsigns: Preview hunk inline" })

            map("n", "<leader>hb", function()
                gitsigns.blame_line({ full = true })
            end, { desc = "Gitsigns: Blame line" })

            map("n", "<leader>hd", gitsigns.diffthis, { desc = "Gitsigns: Diff this" })

            map("n", "<leader>hD", function()
                gitsigns.diffthis("~")
            end, { desc = "Gitsigns: Diff this ~" })

            map("n", "<leader>hQ", function()
                gitsigns.setqflist("all")
            end, { desc = "Gitsigns: Show hunk QF list for entire repository" })

            map("n", "<leader>hq", gitsigns.setqflist, { desc = "Gitsigns: Show hunk QF list for buffer" })

            -- Toggles
            map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Gitsigns: Toggle inline blame" })
            map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Gitsigns: Toggle word diff" })

            -- Text object
            map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Gitsigns: Select hunk" })
        end,
    },
}
