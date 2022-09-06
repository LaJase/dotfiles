local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "buffers",
    separator_style = 'slant',
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    hijack_netrw = true,
    offsets = {
      { filetype = "NvimTree", text = "Explorer", padding = 1 }
    },
  },
})

vim.keymap.set('n', '<C-Right>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<C-Left>', '<Cmd>BufferLineCyclePrev<CR>', {})
