local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

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

vim.keymap.set('n', ';b', function ()
  builtin.buffers(themes.get_dropdown({ previewer = false }))
end)

vim.keymap.set('n', ';r', function()
  builtin.live_grep()
end)

vim.keymap.set('n', ';t', function()
  builtin.help_tags()
end)

vim.keymap.set('n', ';;', function()
  builtin.resume()
end)

vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)

vim.keymap.set('n', ';gs', function ()
  builtin.git_status({
    initial_mode = "normal",
  })
end)

vim.keymap.set('n', ';gc', function ()
  builtin.git_commit({
    initial_mode = "normal",
  })
end)

vim.keymap.set('n', ';k', function ()
  builtin.keymaps()
end)

vim.keymap.set("n", ";f", function()
  telescope.extensions.file_browser.file_browser({
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)

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
