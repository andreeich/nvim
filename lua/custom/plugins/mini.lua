-- mini.nvim - Collection of small independent plugins/modules
--
-- This consolidates all mini.nvim modules into a single plugin specification
-- to avoid conflicts with multiple instances of the same repository.
return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    -- mini.ai - Better Around/Inside textobjects
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    local ai = require 'mini.ai'
    ai.setup {
      n_lines = 500,

      custom_textobjects = {
        o = ai.gen_spec.treesitter {
          a = { '@block.outer', '@conditional.outer', '@loop.outer' },
          i = { '@block.inner', '@conditional.inner', '@loop.inner' },
        },

        f = ai.gen_spec.treesitter {
          a = '@function.outer',
          i = '@function.inner',
        },

        c = ai.gen_spec.treesitter {
          a = '@class.outer',
          i = '@class.inner',
        },

        t = {
          '<([%p%w]-)%f[^<%w][^<>]->.-</%1>',
          '^<.->().*()</[^/]->$',
        },

        d = { '%f[%d]%d+' },

        e = {
          {
            '%u[%l%d]+%f[^%l%d]',
            '%f[%S][%l%d]+%f[^%l%d]',
            '%f[%P][%l%d]+%f[^%l%d]',
            '^[%l%d]+%f[^%l%d]',
          },
          '^().*()$',
        },

        -- buffer textobject (LazyVim-free)
        g = function()
          local from = { line = 1, col = 1 }
          local to = {
            line = vim.fn.line '$',
            col = math.max(vim.fn.getline('$'):len(), 1),
          }

          return {
            from = from,
            to = to,
            vis_mode = 'V', -- linewise
          }
        end,

        u = ai.gen_spec.function_call(),
        U = ai.gen_spec.function_call { name_pattern = '[%w_]' },
      },
    }

    -- mini.statusline - Simple and easy statusline
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- mini.surround - Add/delete/replace surroundings (brackets, quotes, etc.)
    -- Examples:
    --  - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    --  - sd'   - [S]urround [D]elete [']quotes
    --  - sr)'  - [S]urround [R]eplace [)] [']
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
