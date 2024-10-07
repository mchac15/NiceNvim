vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.wo.number = true
vim.wo.relativenumber = true
vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
vim.api.nvim_set_option("clipboard","unnamed")
vim.keymap.set("n","<leader>wt",":bo 15sp<CR>:term<CR>",{})
vim.keymap.set("t","<C-space>","<C-\\><C-n>",{})
