vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- save and format
vim.keymap.set("n", "<C-s>", function()
  require("conform").format({ lsp_fallback = true })
  vim.cmd("w")
end, { noremap = true, silent = true, desc = "Save and format" })

-- open file in file manager
vim.keymap.set(
  "n",
  "<leader>n",
  "<cmd>!dolphin %:p:h &<CR>",
  { noremap = true, silent = true, desc = "Open file in Dolphin" }
)

-- format
vim.keymap.set("n", "<leader>F", function()
  require("conform").format({ lsp_fallback = true })
end, { desc = "Format buffer" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
vim.keymap.set("n", "<leader>fw", builtin.current_buffer_fuzzy_find, { desc = "Find in current buffer" })

-- comment line
vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "Toggle comment" })

-- git
vim.keymap.set("n", "<leader>g", ":LazyGit<CR>", { noremap = true, silent = true })

-- dap
vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>", { desc = "Continue" })
vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dn", "<cmd>lua require('dap').step_over()<CR>", { desc = "Step over" })
vim.keymap.set("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>", { desc = "Step into" })
vim.keymap.set("n", "<leader>do", "<cmd>lua require('dap').step_out()<CR>", { desc = "Step out" })
vim.keymap.set("n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>", { desc = "Run last" })
vim.keymap.set("n", "<leader>ds", "<cmd>lua require('dap').close()<CR>", { desc = "Stop" })

vim.keymap.set("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>", { desc = "Toggle DAP UI" })

-- barbar
vim.keymap.set("n", "<leader><Tab>", ":BufferNext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader><S-Tab>", ":BufferPrevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>x", ":BufferClose<CR>", { desc = "Close tab" })

vim.keymap.set("n", "<leader>tt", ":TransparentToggle<CR>", { desc = "Toggle transparency" })
vim.keymap.set("n", "<leader>tl", ":Lazy<CR>", { desc = "Open plugin manager" })
vim.keymap.set("n", "<leader>tm", ":Mason<CR>", { desc = "Open mason" })
vim.keymap.set("n", "<leader>ts", ":Themery<CR>", { desc = "Change theme" })
