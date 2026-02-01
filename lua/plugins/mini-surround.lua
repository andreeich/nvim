return {
  'echasnovski/mini.surround',
  version = false,
  config = function()
    require('mini.surround').setup {
      mappings = {
        add = '',          -- Add surrounding in Normal and Visual modes
        delete = 'ds',     -- Delete surrounding
        find = '',         -- Find surrounding (to the right)
        find_left = '',    -- Find surrounding (to the left)
        highlight = '',    -- Highlight surrounding
        replace = 'cs',    -- Replace surrounding
        --
        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    }

    -- Set up Zed-like keybinding: 's' in visual mode to add surrounds
    vim.keymap.set('x', 's', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

    -- Alternative keybinding (commented out)
    -- vim.keymap.set('x', 's', function()
    --   require('mini.surround').add 'visual'
    -- end, { desc = 'Add surround (Zed-like)' })
  end,
}
