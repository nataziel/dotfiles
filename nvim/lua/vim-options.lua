vim.o.background = "dark"
vim.cmd("set shell=~/AppData/Local/Programs/Git/usr/bin/bash.exe")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set shellcmdflag=-c")
vim.cmd("set shellslash")
vim.cmd('set shellxquote="')
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.cursorline = true
-- search highlighting, but remove highlight if you hit escape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "Go to next item in quickfix list" })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "Go to previous item in quickfix list" })
vim.hl.on_yank()

vim.diagnostic.config({
	virtual_text = true,
})

vim.keymap.set("n", "<leader>vl", function()
	local new_text = not vim.diagnostic.config().virtual_text
	local new_lines = not vim.diagnostic.config().virtual_lines
	vim.diagnostic.config({ virtual_text = new_text, virtual_lines = new_lines })
end, { desc = "Toggle between inline or inserted diagnostics" })
