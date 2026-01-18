-- [[ Basic Keymaps ]]
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uick list' })
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Tab navigation
vim.keymap.set('n', '[t', '<cmd>tabprevious<CR>', { silent = true, desc = 'Go to previous tab page' })
vim.keymap.set('n', ']t', '<cmd>tabnext<CR>', { silent = true, desc = 'Go to next tab page' })
-- NOTE: Quit
vim.keymap.set('n', '<leader>qb', '<cmd>bdelete<CR>', { silent = true, desc = '[Q]uit [B]uffer' })
vim.keymap.set('n', '<leader>qt', '<cmd>tabclose<CR>', { silent = true, desc = '[Q]uit [T]ab' })
vim.keymap.set('n', '<leader>qq', '<cmd>quit<CR>', { silent = true, desc = '[Q]uit' })
vim.keymap.set('n', '<leader>qa', '<cmd>qall<CR>', { silent = true, desc = '[Q]uit [A]ll' })
vim.keymap.set('n', '<leader>qc', '<cmd>close<CR>', { silent = true, desc = '[Q]uit [C]lose' })
-- NOTE: Write
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { silent = true, desc = '[W]rite' })
vim.keymap.set('n', '<leader>wq', '<cmd>wq<CR>', { silent = true, desc = '[W]rite [Q]uit' })
vim.keymap.set('n', '<leader>wa', '<cmd>wall<CR>', { silent = true, desc = '[W]rite [A]ll' })
vim.keymap.set('n', '<leader>wk', '<cmd>noa w<CR>', { silent = true, desc = '[W]rite noauto[C]md' })
-- NOTE: New
vim.keymap.set('n', '<leader>nb', '<cmd>enew<CR>', { silent = true, desc = '[N]ew [B]uffer' })
vim.keymap.set('n', '<leader>nt', '<cmd>tabnew<CR>', { silent = true, desc = '[N]ew [T]ab' })
-- NOTE: Diagnostics
vim.keymap.set('n', 'gh', vim.diagnostic.open_float, { silent = true, desc = '[G]o to line [D]iagnostics' })
