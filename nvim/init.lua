-- [[ Disabling netrw ]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- [[ Mapping Leader to space ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Plugins
-- If make is present, install and build telescope-fzf-native
if vim.fn.executable('make') == 1 then
  -- 2. Add the plugin to the runtime path
  local status = pcall(vim.pack.add, 'telescope-fzf-native.nvim')

  -- 3. Load the extension into Telescope
  if status then
    -- Note: This assumes you've already loaded 'telescope.nvim'
    pcall(require('telescope').load_extension, 'fzf')
  end
else
  vim.notify("Make not found; telescope-fzf-native not loaded.", vim.log.levels.WARN)
end

vim.pack.add({
        -- Colorschemes
        'https://github.com/navarasu/onedark.nvim',
        'https://github.com/ellisonleao/gruvbox.nvim',
        'https://github.com/folke/tokyonight.nvim',

        -- nvim-lspconfig deps
        'https://github.com/williamboman/mason.nvim',
        'https://github.com/williamboman/mason-lspconfig.nvim',
        'https://github.com/folke/lazydev.nvim',

        -- LSP setup
        'https://github.com/neovim/nvim-lspconfig',

        -- nvim-cmp deps
        'https://github.com/L3MON4D3/LuaSnip',
        'https://github.com/saadparwaiz1/cmp_luasnip',
        'https://github.com/hrsh7th/cmp-nvim-lsp',

        -- auto formatting
        'https://github.com/stevearc/conform.nvim',

        -- autocomplete suggestions
        'https://github.com/hrsh7th/nvim-cmp',

        -- Telescope and dependencies
         'https://github.com/nvim-lua/plenary.nvim',
         'https://github.com/nvim-telescope/telescope.nvim',

        -- Treesitter (syntax highlight)
        'https://github.com/nvim-treesitter/nvim-treesitter',

        'https://github.com/tpope/vim-sleuth',
        'https://github.com/nvim-tree/nvim-web-devicons',

        -- F2 to rename files with LSP
        -- barbar dependency
        'https://github.com/antosha417/nvim-lsp-file-operations',

        -- popup that shows possible keybindings of the command you started typing
        'https://github.com/folke/which-key.nvim',

        -- Git integration to show differed lines on staged files
        -- barbar dependency
        'https://github.com/lewis6991/gitsigns.nvim',

        -- tabs
        'https://github.com/romgrk/barbar.nvim',

        -- statusline
        'https://github.com/nvim-lualine/lualine.nvim',

        -- comment shortcut
        'https://github.com/numToStr/Comment.nvim',

        -- side file tree
        'https://github.com/nvim-tree/nvim-tree.lua',

        -- auto close HTML tags
        'https://github.com/windwp/nvim-ts-autotag'
})

-- ======================================== LSP setup ========================================
-- setting lua_ls to recognize the vim global
require("lazydev").setup({
  library = {
    { path = "luvit-meta/library", words = { "vim%.uv" } },
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local bufnr = ev.buf
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
    end

    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    map('gt', vim.lsp.buf.type_definition, '[G]oto [T]ype definition')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- Telescope integration
    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

    -- Create the :Format command
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
  end,
})

local servers = {
  eslint                          = {},
  gopls                           = {},
  html                            = {},
  dockerls                        = {},
  docker_compose_language_service = {},
  templ                           = {},
  ts_ls                           = {},
  lua_ls                          = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  cssls                           = {},
  clangd                          = {},
  pyright                         = {},
}

-- Initialize Mason
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { "lua_ls", "gopls", "pyright", "eslint" }, -- add your list here
})

-- Use the new native enablement
for server, config in pairs(servers) do
  -- Set the config (replaces the 'settings' key in .setup)
  vim.lsp.config(server, config)
end

-- This line effectively replaces the old "setup_handlers" 
-- It tells Neovim to use lspconfig's collection to enable these servers
for _, server in ipairs(require('mason-lspconfig').get_installed_servers()) do
  vim.lsp.enable(server)
end

-- ======================================== END LSP setup ========================================
-- ======================================== Autocomplete setup ========================================

local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- ======================================== END Autocomplete setup ========================================

-- ======================================== Telescope setup ========================================
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                   -- enable fuzzy search
      override_generic_sorter = true, -- override the default sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "ignore_case",      -- ignore case unless capitalized
    }
  },
  pickers = {
    oldfiles = {
      cwd_only = true
    }
  },
  defaults = {
    file_ignore_patterns = {
      "node_modules", "logs", "build"
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--hidden',
      '--ignore-case',  -- Always ignore case in grep
      '--fixed-strings' -- Always search for text, never regex
    }
  },
}

pcall(require('telescope').load_extension, 'fzf')

-- Main Setting bindings
-- CTRL-F
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })

-- CTRL SHIFT F
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch with Live [G]rep' })

-- GIT modified files tab
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').git_status, { desc = 'Find git modified files' })

-- Other bindings given by Kickstart
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>so', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })

-- ======================================== END Telescope setup ========================================

-- ======================================== Treesitter setup ========================================
-- Setup Treesitter languages
require('nvim-treesitter').install({ 
  'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'elixir', 'templ', 'markdown', 'html', 'css' 
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'py', 'ts', 'js' },
  callback = function() vim.treesitter.start() end,
})

-- ======================================== END Treesitter setup ========================================

-- Setup Gitsigns
require('gitsigns').setup({
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
      { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
    vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, 
      { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
    vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, 
      { buffer = bufnr, desc = '[P]review [H]unk' })
  end,
})

--  Setup lualine
require('lualine').setup {
  options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1
      }
    },
  }
}

-- Setup barbar
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

--Setup File Manager / nvim-tree
require("nvim-tree").setup({
  git = {
    ignore = false
  },
  update_focused_file = {
    enable = true,
    update_root = false
  },
})

vim.keymap.set("n", "<C-b>", function()
  require("nvim-tree.api").tree.toggle()
end, 
{ desc = "Toggle NvimTree" })

-- [[ General Settings options ]]

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
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
--

vim.cmd("colorscheme gruvbox")
