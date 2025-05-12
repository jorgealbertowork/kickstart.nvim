-- Toggle Zen Mode
vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>', { desc = 'Toggle Zen Mode' })

-- Open parent directory in Oil
vim.keymap.set('n', '-', '<cmd>Oil --float<CR>', { desc = 'Open paret directory in Oil' })

-- Special paste command (Primeagen's greatest remap ever)
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste' })

-- Center cursor when navigating up or down
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' })
vim.keymap.set('n', 'gg', 'ggzz', { desc = 'Jumps to [line number] and centers line' })
