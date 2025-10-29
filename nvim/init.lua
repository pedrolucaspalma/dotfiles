-- [[ Mapping Leader to space ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Disabling netrw ]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- [[ Package Manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Lazy Plugins ]]
require 'lazy-plugins'

-- [[ Theme ]]
vim.cmd("colorscheme onedark")

-- [[ LSP / Mason setup ]]
require 'lsp-setup'

-- [[ Status Line / Lualine setup ]]
require('lualine').setup {
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1
      }
    },
  }
}

require 'telescope-setup'
require 'treesitter-setup'
require 'cmp-setup'

-- [[ Setup Autocomplete / conform ]]
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    tex = { "latexindent" },
    go = { "goimports", "gofmt" },
    html = { "djlint" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})


-- [[ Setup Tabs / barbar ]]
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

vim.keymap.set('n', '<M-1>', '<Cmd>BufferGoto 1<CR>')
vim.keymap.set('n', '<M-2>', '<Cmd>BufferGoto 2<CR>')
vim.keymap.set('n', '<M-3>', '<Cmd>BufferGoto 3<CR>')
vim.keymap.set('n', '<M-4>', '<Cmd>BufferGoto 4<CR>')
-- vim.keymap.set('n', '<M-5>', '<Cmd>BufferGoto 5<CR>')
-- vim.keymap.set('n', '<M-6>', '<Cmd>BufferGoto 6<CR>')
-- vim.keymap.set('n', '<M-7>', '<Cmd>BufferGoto 7<CR>')
-- vim.keymap.set('n', '<M-8>', '<Cmd>BufferGoto 8<CR>')
-- vim.keymap.set('n', '<M-9>', '<Cmd>BufferGoto 9<CR>')

vim.keymap.set('n', '<M-h>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<M-l>', '<Cmd>BufferNext<CR>')
vim.keymap.set('n', '<M-w>', '<Cmd>BufferClose<CR>')


vim.g.barbar_auto_setup = false

-- [[ Setup File Manager / nvim-tree ]]
require("nvim-tree").setup({
  git = {
    ignore = false
  },
  update_focused_file = {
    enable = true,
    update_root = false
  },
})

-- Toggle with Ctrl+B
vim.keymap.set("n", "<C-b>", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree" })

-- [[ General Settings options ]]
vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.o.relativenumber = true
vim.o.swapfile = false
vim.o.clipboard = 'unnamedplus'
vim.o.wrap = true

-- [[ Keymaps options ]]
-- Fast Indenting
vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("n", "<S-Tab>", "<<")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- Rebinding vertical movements to put the cursor at the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<C-c>', '"+yy', { noremap = true, silent = true })

-- vim: ts=2 sts=2 sw=2 et
