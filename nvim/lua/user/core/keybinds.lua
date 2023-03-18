-- improved search: keep the buffer center when iterating over results
vim.keymap.set("n", "n", "nzzzv", { remap = false, desc = "Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { remap = false, desc = "Prev search result" })

-- improved yank: add the ability to yank to the end of line or the entire buffer
vim.keymap.set("n", "Y", "y$", { remap = false, desc = "Yank to end of line" })
vim.keymap.set("n", "gy", 'gg"+yG', { remap = false, desc = "Yank entire buffer" })

-- quickfix: keybinds to more easily interact with quickfix list (`:help quickfix`)
vim.keymap.set("n", "ql", "<cmd>copen<cr>", { remap = false, desc = "Open quickfixlist" })
vim.keymap.set("n", "qj", "<cmd>cnext<cr>", { remap = false, desc = "Next quickfixlist item" })
vim.keymap.set("n", "qk", "<cmd>cprev<cr>", { remap = false, desc = "Prev quickfixlist item" })
