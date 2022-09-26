local opts = { noremap = true, silent = true }

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
keymap('n', '<S-a>', ':%bd|e#|bd#|NvimTreeToggle<CR>', opts )
keymap('n', '<C-Right>', '<Cmd>BufferLineCycleNext<CR>', opts)
keymap('n', '<C-Left>', '<Cmd>BufferLineCyclePrev<CR>', opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Nvim tree
keymap("n", '<leader>e', "<cmd>:NvimTreeToggle<cr>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Telescope
keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap('n', ';b', "<cmd>lua require'telescope.builtin'.buffers(themes.get_dropdown({ previewer = false }))<cr>", opts)
keymap('n', ';r', "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)
keymap('n', ';p', "<cmd>lua require('telescope').extensions.projects.projects()<cr>", opts)
keymap('n', ';t', "<cmd>lua require'telescope.builtin'.help_tags()<cr>", opts)
keymap('n', ';e', "<cmd>lua require'telescope.builtin'.diagnostics()<cr>", opts)
keymap('n', ';gs', "<cmd>lua require'telescope.builtin'.git_status({initial_mode = \"normal\"}))<cr>", opts)
keymap('n', ';gc', "<cmd>lua require'telescope.builtin'.git_commit({initial_mode = \"normal\"}))<cr>", opts)
keymap('n', ';k', "<cmd>lua require'telescope.builtin'.keymaps()<cr>", opts)
keymap('n', ';;', "<cmd>lua require'telescope.builtin'.resume()<cr>", opts)
-- For file_browser here are some shortcuts
-- <cr>: opens the currently selected file, or navigates to the
-- c: Create file/folder at current path (trailing path
-- r: Rename multi-selected files/folders
-- m: Move multi-selected files/folders to current path
-- y: Copy (multi-)selected files/folders to current path
-- d: Delete (multi-)selected files/folders
-- o: Open file/folder with default system application
-- g: Go to parent directory
-- e: Go to home directory
-- w: Go to current working directory (cwd)
-- t: Change nvim's cwd to selected folder/file(parent)
-- f: Toggle between file and folder browser
-- h: Toggle hidden files/folders
-- s: Toggle all entries ignoring ./ and ../

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

