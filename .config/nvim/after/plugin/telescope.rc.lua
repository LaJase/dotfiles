local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require('telescope.actions')

-- For file_browser here are some shortcuts
telescope.setup {
  defaults = {
    path_display={"smart"},
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          -- put here some mappings for insert mode
        },
        ["n"] = {
          -- put her some mappings for normal mode
        },
      },
    },
  },
}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", ";b", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", ";r", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)
keymap("n", ";t", "<cmd>lua require'trouble.providers.telescope'.open_with_trouble()<cr>", opts)
keymap("n", ";e", "<cmd>lua require'telescope.builtin'.diagnostics()<cr>", opts)
keymap("n", ";;", "<cmd>lua require'telescope.builtin'.resume()<cr>", opts)
keymap("n", ";k", "<cmd>lua require'telescope.builtin'.keymaps()<cr>", opts)
keymap("n", ";gs", "<cmd>lua require'telescope.builtin'.git_status({initial_mode = normal})<cr>", opts)
keymap("n", ";gc", "<cmd>lua require'telescope.builtin'.git_commit({initial_mode = normal})<cr>", opts)

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
