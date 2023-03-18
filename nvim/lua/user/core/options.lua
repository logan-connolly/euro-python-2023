--
-- General settings options for Neovim.
--

-- defined leader key that you can prefix commands with
vim.g.mapleader = " "

-- set fish as default shell to use
vim.o.shell = "/usr/bin/fish"

-- enable syntax highlighting
vim.o.syntax = "on"

-- show numbers in the gutter
vim.wo.number = true

-- show numbers relative to where you are
vim.wo.relativenumber = true

-- extend the left gutter by two spaces
vim.wo.signcolumn = "yes:2"

-- number set tab width to two spaces
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- improved scrolling
vim.wo.scrolloff = 8
vim.wo.sidescrolloff = 8

-- don't wrap to new line
vim.wo.wrap = false
