require('neoscroll').setup({
  mappings = { '<C-u>', '<C-d>' },
  post_hook = function()
    local mode = vim.api.nvim_get_mode().mode
    -- Ensure it's normal mode before applying `zz`
    if mode == "n" then
      vim.cmd("normal! zz") -- Center the cursor after scrolling
    end
  end,
  hide_cursor = true,          -- Hide cursor while scrolling
  stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  duration_multiplier = 1.0,   -- Global duration multiplier
  easing = 'linear',           -- Default easing function
  pre_hook = nil,              -- Function to run before the scrolling animation starts
  performance_mode = false,    -- Disable "Performance Mode" on all buffers.
  ignored_events = {           -- Events ignored while scrolling
    'WinScrolled', 'CursorMoved'
  },
})
