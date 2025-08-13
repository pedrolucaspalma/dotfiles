-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require 'lazy-bootstrap'
require 'lazy-plugins'
require 'lsp-setup'
require 'lsp-status'

require 'options'
require 'keymaps'

require 'telescope-setup'
require 'treesitter-setup'
require 'cmp-setup'
require 'conform-setup'
require 'theme'
require 'barbar-setup'
require 'colorizer-setup'
require 'nvim-scrollbar-setup'
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
