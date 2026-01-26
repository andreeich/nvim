return {

  {
    'ggandor/leap.nvim',
    labels = 'sfnjklhodweimbuyvrgtaqpcxz',
    config = function()
      vim.keymap.set({ 'n', 'o' }, 's', '<Plug>(leap)', { desc = 'Leap in window' })
      vim.keymap.set('n', '<S-s>', '<Plug>(leap-from-window)', { desc = 'Leap from window' })
    end,
  },
  {
    'ggandor/flit.nvim',
    enabled = true,
    keys = function()
      ---@type LazyKeysSpec[]
      local ret = {}
      for _, key in ipairs { 'f', 'F', 't', 'T' } do
        ret[#ret + 1] = { key, mode = { 'n', 'x', 'o' } }
      end
      return ret
    end,
    opts = { labeled_modes = 'nx' },
  },
  { 'tpope/vim-repeat', event = 'VeryLazy' },
}
