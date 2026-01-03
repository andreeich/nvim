return {
  'nvim-mini/mini.files',
  opts = {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 45,
    },
    options = {
      -- Whether to use for editing directories
      -- Disabled by default in LazyVim because neo-tree is used for that
      use_as_default_explorer = false,
    },
  },
  keys = {
    {
      '<leader>fm',
      function()
        require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = 'Open mini.files (Directory of Current File)',
    },
    {
      '<leader>fM',
      function()
        require('mini.files').open(vim.uv.cwd(), true)
      end,
      desc = 'Open mini.files (cwd)',
    },
  },
  config = function(_, opts)
    require('mini.files').setup(opts)

    -- Close mini.files when telescope opens (proper conflict resolution)
    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopeFindPre",
      callback = function()
        local ok, mini_files = pcall(require, "mini.files")
        if ok then
          mini_files.close()
        end
      end
    })

    -- Function to open file/directory in system file manager and focus on element
    local system_open = function()
      local fs_entry = require('mini.files').get_fs_entry()
      if not fs_entry then
        return
      end

      local path = fs_entry.path

      -- For files, reveal in containing folder with focus
      if vim.fn.has('mac') == 1 then
        -- macOS: Use 'open -R' to reveal in Finder
        vim.fn.system(string.format('open -R %s', vim.fn.shellescape(path)))
      elseif vim.fn.has('win32') == 1 then
        -- Windows: Use 'explorer /select'
        vim.fn.system(string.format('explorer /select,%s', vim.fn.shellescape(path)))
      else
        -- Linux: Fall back to opening containing directory
        local parent_dir = vim.fn.fnamemodify(path, ':h')
        vim.ui.open(parent_dir)
      end
    end

    -- Function to copy path with selector (similar to neo-tree)
    local copy_path = function()
      local fs_entry = require('mini.files').get_fs_entry()
      if not fs_entry then
        vim.notify('No file selected', vim.log.levels.WARN)
        return
      end

      local filepath = fs_entry.path
      local filename = fs_entry.name
      local modify = vim.fn.fnamemodify

      local vals = {
        ['FILENAME'] = filename,
        ['PATH (CWD)'] = modify(filepath, ':.'),
        ['PATH (HOME)'] = modify(filepath, ':~'),
      }

      local options = vim.tbl_filter(function(val)
        return vals[val] ~= ''
      end, vim.tbl_keys(vals))

      if vim.tbl_isempty(options) then
        vim.notify('No values to copy', vim.log.levels.WARN)
        return
      end

      table.sort(options)
      vim.ui.select(options, {
        prompt = 'Choose to copy to clipboard:',
        format_item = function(item)
          return ('%s: %s'):format(item, vals[item])
        end,
      }, function(choice)
        local result = vals[choice]
        if result then
          vim.notify(('Copied: `%s`'):format(result))
          vim.fn.setreg('+', result)
        end
      end)
    end

    local show_dotfiles = true
    local filter_show = function(fs_entry)
      return true
    end
    local filter_hide = function(fs_entry)
      return not vim.startswith(fs_entry.name, '.')
    end

    local toggle_dotfiles = function()
      show_dotfiles = not show_dotfiles
      local new_filter = show_dotfiles and filter_show or filter_hide
      require('mini.files').refresh { content = { filter = new_filter } }
    end

    local map_split = function(buf_id, lhs, direction, close_on_file)
      local rhs = function()
        local new_target_window
        local cur_target_window = require('mini.files').get_explorer_state().target_window
        if cur_target_window ~= nil then
          vim.api.nvim_win_call(cur_target_window, function()
            vim.cmd('belowright ' .. direction .. ' split')
            new_target_window = vim.api.nvim_get_current_win()
          end)

          require('mini.files').set_target_window(new_target_window)
          require('mini.files').go_in { close_on_file = close_on_file }
        end
      end

      local desc = 'Open in ' .. direction .. ' split'
      if close_on_file then
        desc = desc .. ' and close'
      end
      vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
    end

    local files_set_cwd = function()
      local cur_entry_path = MiniFiles.get_fs_entry().path
      local cur_directory = vim.fs.dirname(cur_entry_path)
      if cur_directory ~= nil then
        vim.fn.chdir(cur_directory)
      end
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id

        vim.keymap.set('n', opts.mappings and opts.mappings.toggle_hidden or 'g.', toggle_dotfiles,
          { buffer = buf_id, desc = 'Toggle hidden files' })

        vim.keymap.set('n', opts.mappings and opts.mappings.change_cwd or 'gc', files_set_cwd,
          { buffer = args.data.buf_id, desc = 'Set cwd' })

        -- Copy path functionality (similar to neo-tree Y mapping)
        vim.keymap.set('n', 'Y', copy_path, { buffer = buf_id, desc = 'Copy path' })

        -- System open functionality (similar to neo-tree O and <S-CR> mappings)
        vim.keymap.set('n', 'O', system_open, { buffer = buf_id, desc = 'Open in system file manager' })
        vim.keymap.set('n', '<S-CR>', system_open, { buffer = buf_id, desc = 'Open in system file manager' })

        map_split(buf_id, opts.mappings and opts.mappings.go_in_horizontal or '<C-w>s', 'horizontal', false)
        map_split(buf_id, opts.mappings and opts.mappings.go_in_vertical or '<C-w>v', 'vertical', false)
        map_split(buf_id, opts.mappings and opts.mappings.go_in_horizontal_plus or '<C-w>S', 'horizontal', true)
        map_split(buf_id, opts.mappings and opts.mappings.go_in_vertical_plus or '<C-w>V', 'vertical', true)
      end,
    })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesActionRename',
      callback = function(event)
        Snacks.rename.on_rename_file(event.data.from, event.data.to)
      end,
    })
  end,
}
