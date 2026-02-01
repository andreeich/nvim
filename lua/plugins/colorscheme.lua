return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          -- comments = { italic = false }, -- Disable italics in comments
        },
      }
    end,
  },
  { 'EdenEast/nightfox.nvim' },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'carbonfox'
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'gruvbox'
    end,
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'oxocarbon'
    end,
  },
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'onedark_dark'
    end,
  },
  { 'patstockwell/vim-monokai-tasty', priority = 1000 },
  {
    'andreeich/castlevania.nvim',
    config = function()
      vim.cmd.colorscheme 'blade'
    end,
  },
}
