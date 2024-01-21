require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 40,
  },
  renderer = {
    group_empty = true,
  },
  update_focused_file = {
    enable = true
  },
  filters = {
    dotfiles = false,
  },
})

--Open filetree
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<cr>')
