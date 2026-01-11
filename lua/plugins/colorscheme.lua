return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          -- comments = { italic = false }, -- Disable italics in comments
        },
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'
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
    priority = 1000, -- Ensure it loads first
    config = function()
      -- vim.cmd.colorscheme 'onedark_dark'
    end,
  },
  { 'typicode/bg.nvim', lazy = false },
  { 'patstockwell/vim-monokai-tasty', priority = 1000 },
  -- { 'dracula/vim', priority = 1000 },
  {
    dir = '~/.local/share/nvim/site/pack/themes/start/dracula_pro',
    name = 'dracula_pro',
    priority = 1000,
    config = function()
      vim.g.dracula_colorterm = 1
      vim.cmd.colorscheme 'dracula_pro_blade'
    end,
  },
  -- {
  --   'andreeich/dracula.nvim',
  --   name = 'dracula',
  --   lazy = false, -- make sure we load this during startup
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     require('dracula').load { style = 'strigoi' }
  --     vim.keymap.set('n', '<leader>tdc', ':colorscheme dracula-carmilla<CR>')
  --     vim.keymap.set('n', '<leader>tds', ':colorscheme dracula-sypha<CR>')
  --     vim.keymap.set('n', '<leader>dt', ':colorscheme dracula-strigoi<CR>')
  --     vim.keymap.set('n', '<leader>dl', ':colorscheme dracula-lenore<CR>')
  --     vim.keymap.set('n', '<leader>da', ':colorscheme dracula-akasha<CR>')
  --   end,
  -- },
}
