return {
  {
    'ggandor/leap.nvim',
    config = function()
      vim.keymap.set({ 'n', 'o' }, 's', '<Plug>(leap)', { desc = 'Leap in window' })
      vim.keymap.set('n', '<S-s>', '<Plug>(leap-from-window)', { desc = 'Leap from window' })
    end,
  },
}
