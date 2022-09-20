local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disbale = {},
  },
  ensure_installed = {
    "tsx",
    "typescript",
    "json",
    "yaml",
    "css",
    "html",
    "lua",
    "scss",
  },
  auto_install = true,
  autotag = {
    enable = true,
  },
}
