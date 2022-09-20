local opts = { noremap = true, silent = true }
local term_opts = { silent =true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
-- <Rightkeymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', opts)

-- Split windows
keymap('n', 'ws', '<C-w>s', opts)
keymap('n', 'wv', '<C-w>v', opts)

-- Manage windows
keymap('n', 'wx', '<C-w>x', opts)
keymap('n', 'wo', '<C-w>o', opts)
keymap('n', 'wc', '<C-w>c', opts)

-- Change windows
keymap('n', 'wh', '<C-w>h', opts)
keymap('n', 'wj', '<C-w>j', opts)
keymap('n', 'wk', '<C-w>k', opts)
keymap('n', 'wl', '<C-w>l', opts)

-- Resize window
keymap('n', '<C-w><left>', '<C-w><', opts)
keymap('n', '<C-w><right>', '<C-w>>', opts)
keymap('n', '<C-w><up>', '<C-w>+', opts)
keymap('n', '<C-w><down>', '<C-w>-', opts)
keymap('n', 'w<left>', '<C-w><', opts)
keymap('n', 'w<right>', '<C-w>>', opts)
keymap('n', 'w<up>', '<C-w>-', opts)
keymap('n', 'w<down>', '<C-w>+', opts)

