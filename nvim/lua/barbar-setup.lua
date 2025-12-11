require('barbar').setup {
  sidebar_filetypes = {
    NvimTree = true,
    undotree = { text = 'undotree' },
  },
  animation = true,
  auto_hide = 1,
  tabpages = false,
  clickable = true,
}
-- Goto buffer in position...
-- vim.keymap.set('n', '<M-1>', '<Cmd>BufferGoto 1<CR>')
-- vim.keymap.set('n', '<M-2>', '<Cmd>BufferGoto 2<CR>')
-- vim.keymap.set('n', '<M-3>', '<Cmd>BufferGoto 3<CR>')
-- vim.keymap.set('n', '<M-4>', '<Cmd>BufferGoto 4<CR>')
-- vim.keymap.set('n', '<M-5>', '<Cmd>BufferGoto 5<CR>')
-- vim.keymap.set('n', '<M-6>', '<Cmd>BufferGoto 6<CR>')
-- vim.keymap.set('n', '<M-7>', '<Cmd>BufferGoto 7<CR>')
-- vim.keymap.set('n', '<M-8>', '<Cmd>BufferGoto 8<CR>')
-- vim.keymap.set('n', '<M-9>', '<Cmd>BufferGoto 9<CR>')

vim.keymap.set('n', '<M-h>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<M-l>', '<Cmd>BufferNext<CR>')
vim.keymap.set('n', '<M-w>', '<Cmd>BufferClose<CR>')


vim.g.barbar_auto_setup = false
