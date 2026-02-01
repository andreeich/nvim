return {
  -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  config = function(_, opts)
    require('conform').setup(opts)

    -- ESLint autocommand for auto-fixing on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('eslint_fix', { clear = true }),
      pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
      callback = function()
        vim.cmd 'silent! LspEslintFixAll'
      end,
    })
  end,
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      python = { 'black' },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      javascript = { 'eslint', 'prettier' },
      typescript = { 'eslint', 'prettier' },
      typescriptreact = { 'eslint', 'prettier' },
      tsx = { 'prettier', 'eslint' },
      javascriptreact = { 'eslint', 'prettier' },
      json = { 'prettier' },
      css = { 'prettier' },
      scss = { 'prettier' },
      html = { 'prettier' },
      markdown = { 'prettier' },
    },
  },
}
