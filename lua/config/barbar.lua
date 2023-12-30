vim.g.barbar_auto_setup = true

require("barbar").setup({
	auto_hide = 1,
	animation = true,
})

vim.keymap.set("n", "<leader><Tab>", ":BufferNext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader><S-Tab>", ":BufferPrevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>x", ":BufferClose<CR>", { desc = "Close tab" })
