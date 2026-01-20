return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>g', '<cmd>vert Git<CR>', { desc = '[G]it [D]ashboard' })

    -- Map Tab to the fugitive diff toggle using Plug mapping
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'fugitive',
      callback = function()
        vim.keymap.set('n', '<Tab>', '<Plug>fugitive:=', { buffer = true, desc = 'Toggle inline diff' })
      end,
    })
  end,
}
