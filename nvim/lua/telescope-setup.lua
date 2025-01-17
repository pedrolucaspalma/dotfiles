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
