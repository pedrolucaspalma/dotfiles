-- [[ Setting options ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
vim.opt.swapfile = false
vim.o.clipboard = 'unnamedplus'
vim.opt.wrap = false
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

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

-- [[ Package Manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Lazy Plugins ]]

require 'lazy-plugins'
require 'lsp-setup'

require 'statusline-setup'



require 'telescope-setup'
require 'treesitter-setup'
require 'cmp-setup'
require 'conform-setup'
require 'theme'
require 'barbar-setup'
-- vim: ts=2 sts=2 sw=2 et
