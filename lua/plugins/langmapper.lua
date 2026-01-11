return {
  {
    'Wansmer/langmapper.nvim',
    lazy = false,
    priority = 1,
    config = function()
      local function escape(str)
        -- You need to escape these characters to work correctly
        local escape_chars = [[;,."|\]]
        return vim.fn.escape(str, escape_chars)
      end

      -- Recommended to use lua template string
      local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
      local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
      local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
      local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

      vim.opt.langmap = vim.fn.join({
        -- | `to` should be first     | `from` should be second
        escape(ru_shift) .. ';' .. escape(en_shift),
        escape(ru) .. ';' .. escape(en),
      }, ',')

      require('langmapper').setup({
        -- Add mapping for every CTRL+ binding or not
        map_all_ctrl = true,
        -- Modes to map CTRL+ bindings
        ctrl_map_modes = { 'n', 'o', 'i', 'c', 't', 'v' },
        -- Wrap all keymap functions for automatic translation
        hack_keymap = true,
        -- Don't translate insert mode commands when hacking
        disable_hack_modes = { 'i' },
        -- Modes whose mappings will be checked during automapping
        automapping_modes = { 'n', 'v', 'x', 's' },
        -- Standard English layout
        default_layout = [[ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{}~abcdefghijklmnopqrstuvwxyz,.;'[]`]],
        -- Names of layouts. If empty, will handle all configured layouts
        use_layouts = {},
        -- Layout configuration
        layouts = {
          ru = {
            -- Name of your second keyboard layout in system
            -- Should be the same as result string of get_current_layout_id()
            id = 'com.apple.keylayout.RussianWin',
            -- Fallback layout to translate. Should be same length as default layout
            layout = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯБЮЖЭХЪËфисвуапршолдьтщзйкыегмцчнябюжэхъё',
          },
        },
        -- OS configuration (optional - works without im-select)
        os = {
          Darwin = {
            get_current_layout_id = function()
              -- Optional: install im-select for automatic layout detection
              -- brew install im-select
              local cmd = 'im-select'
              if vim.fn.executable(cmd) then
                local output = vim.split(vim.trim(vim.fn.system(cmd)), '\n')
                return output[#output]
              end
              -- Fallback: return nil to use manual detection
              return nil
            end,
          },
        },
      })

      -- Auto-translate all registered mappings at the end of init
      vim.schedule(function()
        require('langmapper').automapping({ global = true, buffer = true })
      end)
    end,
  },
}
