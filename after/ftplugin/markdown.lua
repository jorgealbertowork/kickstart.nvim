vim.opt_local.wrap = true -- Wrap text
vim.opt_local.breakindent = true -- Match indent on line break
vim.opt_local.linebreak = true -- Line break on whole words
vim.opt_local.textwidth = 80 -- Set text width to 80 characters

-- Spell check
vim.opt_local.spelllang = 'en_us'
vim.opt_local.spell = true

-- Set format options for text formatting
vim.opt_local.formatoptions = 't1'

-- Map 'j' and 'k' to move through visual lines instead of wrapped lines
vim.api.nvim_buf_set_keymap(0, 'n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '0', 'g0', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '$', 'g$', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'v', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'v', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'v', '0', 'g0', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'v', '$', 'g$', { noremap = true, silent = true })
-- Enable smart indent
vim.opt_local.colorcolumn = ''
vim.opt_local.smartindent = true
vim.opt_local.spell = true
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

-- Disable tab expansion to spaces
vim.opt_local.expandtab = false

vim.opt_local.scrolloff = 1
