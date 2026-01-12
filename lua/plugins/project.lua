return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {
      detection_methods = { 'pattern' },
      patterns = {
        '.git',
        'pnpm-workspace.yaml',
        'yarn.lock',
        'package-lock.json',
        'turbo.json',
        'nx.json',
      },
    }
  end,
}
