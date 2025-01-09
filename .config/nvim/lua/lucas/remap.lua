-- leader
vim.g.mapleader = " "

-- exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- save
vim.keymap.set("n", "<leader>s", ":w<CR>")

-- format
vim.keymap.set("n", "<leader>lf", function()
    vim.lsp.buf.format()
end)

-- move code around inside visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center the screen when moving vertically
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")
vim.keymap.set("n", "<S-w>", ":Bdelete<CR>")

-- do not quit vim accidentaly
vim.keymap.set("n", "Q", "<nop>")
