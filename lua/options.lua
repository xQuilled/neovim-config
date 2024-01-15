vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.clipboard = "unnamedplus"

-- Themery block
-- This block will be replaced by Themery.
vim.cmd("colorscheme catppuccin")
vim.g.theme_id = 1
-- end themery block

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = false
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- show line numbers
vim.opt.number = true

-- line wrap
vim.opt.wrap = true

vim.o.cmdheight = 0
