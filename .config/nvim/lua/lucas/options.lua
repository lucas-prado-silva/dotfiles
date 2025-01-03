-- line numbers
vim.opt.nu = false
vim.opt.relativenumber = false
vim.keymap.set(
    "n",
    "<leader>z",
    "<cmd>lua vim.wo.number = not vim.wo.number;vim.wo.relativenumber = not vim.wo.relativenumber<cr>",
    { desc = "toggle line numbers" }
)

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.autowrite = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true -- ignore case in search patterns

vim.opt.termguicolors = true

vim.opt.timeout = true
vim.opt.timeoutlen = 500

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smoothscroll = true

vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

vim.g.bg = 'dark'

vim.opt.conceallevel = 0          -- so that `` is visible in markdown files

vim.opt.mouse = "a"               -- allow the mouse to be used in neovim

vim.opt.pumheight = 10            -- pop up menu height
vim.opt.showmode = false          -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0           -- always show tabs
vim.opt.smartcase = true          -- smart case
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.cmdheight = 0             -- more space in the neovim command line for displaying messages
vim.opt.numberwidth = 2           -- set number column width to 2 {default 4}

-- hide status bar
vim.cmd([[set laststatus=0]])
vim.cmd("hi! link StatusLine Normal")
vim.cmd("hi! link StatusLineNC Normal")
vim.cmd("set statusline=%{repeat('─',winwidth('.'))}")

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])