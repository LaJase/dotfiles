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
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize window
keymap('n', '<C-w><left>', '<C-w><', opts)
keymap('n', '<C-w><right>', '<C-w>>', opts)
keymap('n', '<C-w><up>', '<C-w>+', opts)
keymap('n', '<C-w><down>', '<C-w>-', opts)
keymap('n', 'w<left>', '<C-w><', opts)
keymap('n', 'w<right>', '<C-w>>', opts)
keymap('n', 'w<up>', '<C-w>-', opts)
keymap('n', 'w<down>', '<C-w>+', opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Manage buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)
keymap('n', '<C-Right>', '<Cmd>BufferLineCycleNext<CR>', opts)
keymap('n', '<C-Left>', '<Cmd>BufferLineCyclePrev<CR>', opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- delete word in insert_text_mode
keymap("i", "<C-BS>", "<C-W>", opts)
keymap("i", "<C-h>", "<C-W>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Nvim tree
keymap("n", '<leader>e', "<cmd>:NvimTreeToggle<cr>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
-- Manage buffers_color
keymap('n','<leader>bo', ':%bd|e#|bd#|NvimTreeToggle<CR>', opts )
keymap('n', '<leader><space>', ':noh<CR>', opts)
