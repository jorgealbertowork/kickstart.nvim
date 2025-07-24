-- Set a blinking cursor
vim.o.guicursor = 'n-v-c:block,i:ver25-Cursor/lCursor-blinkon600-blinkoff600-blinkwait0'

-- Sets color to column 80
vim.opt.colorcolumn = '79'

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup('UserConfig', {})

-- Create directories when saving files
vim.api.nvim_create_autocmd('BufWritePre', {
  group = augroup,
  callback = function()
    local dir = vim.fn.expand '<afile>:p:h'
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

-- [[ Tabs Configuration ]]
vim.opt.showtabline = 1 -- Always show tabline (0=never, 1=when multiple tabs, 2=always)
vim.opt.tabline = '' -- Use default tabline (empty string uses built-in)

-- Transparent tabline appearance
vim.cmd [[
  hi TabLineFill guibg=NONE ctermfg=242 ctermbg=NONE
]]

-- Function to duplicate current tab
local function duplicate_tab()
  local current_file = vim.fn.expand '%:p'
  if current_file ~= '' then
    vim.cmd('tabnew ' .. current_file)
  else
    vim.cmd 'tabnew'
  end
end

-- Function to close tabs to the right
local function close_tabs_right()
  local current_tab = vim.fn.tabpagenr()
  local last_tab = vim.fn.tabpagenr '$'

  for i = last_tab, current_tab + 1, -1 do
    vim.cmd(i .. 'tabclose')
  end
end

-- Function to close tabs to the left
local function close_tabs_left()
  local current_tab = vim.fn.tabpagenr()

  for i = current_tab - 1, 1, -1 do
    vim.cmd '1tabclose'
  end
end

-- Enhanced keybindings
vim.keymap.set('n', '<leader>td', duplicate_tab, { desc = 'Duplicate current tab' })
vim.keymap.set('n', '<leader>tr', close_tabs_right, { desc = 'Close tabs to the right' })
vim.keymap.set('n', '<leader>tL', close_tabs_left, { desc = 'Close tabs to the left' })

-- Function to close buffer but keep tab if it's the only buffer in tab
local function smart_close_buffer()
  local buffers_in_tab = #vim.fn.tabpagebuflist()
  if buffers_in_tab > 1 then
    vim.cmd 'bdelete'
  else
    -- If it's the only buffer in tab, close the tab
    vim.cmd 'tabclose'
  end
end
vim.keymap.set('n', '<leader>bd', smart_close_buffer, { desc = 'Smart close buffer/tab' })

require('nvim-autopairs').setup {
  disable_filetype = { 'html' },
}

-- Setup ColorColumn by filetype
-- vim.api.nvim_create_augroup('ColorcolumnByFT', { clear = true })
-- vim.api.nvim_create_autocmd('FileType', {
--   group = 'ColorcolumnByFT',
--   pattern = { 'python', 'c', 'cpp', 'sh' },
--   callback = function()
--     vim.opt_local.colorcolumn = '79'
--   end,
-- })
-- vim.api.nvim_create_autocmd('FileType', {
--   group = 'ColorcolumnByFT',
--   pattern = { 'lua', 'rust' },
--   callback = function()
--     vim.opt_local.colorcolumn = '100'
--   end,
-- })
-- vim.api.nvim_create_autocmd('FileType', {
--   group = 'ColorcolumnByFT',
--   pattern = {
--     'javascript',
--     'javascriptreact',
--     'javascript.jsx',
--     'typescript',
--     'typescriptreact',
--     'typescript.tsx',
--   },
--   callback = function()
--     vim.opt_local.colorcolumn = '120'
--   end,
-- })
