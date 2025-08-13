vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require 'lazy-bootstrap'
require 'lazy-plugins'
require 'lsp-setup'
-- require 'lsp-status'

require 'statusline-setup'

require 'options'
require 'keymaps'

require 'telescope-setup'
require 'treesitter-setup'
require 'cmp-setup'
require 'conform-setup'
require 'theme'
require 'barbar-setup'
-- vim: ts=2 sts=2 sw=2 et
