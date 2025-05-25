vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'number'

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Tab and indent settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Enable block cursor in all modes
vim.opt.guicursor = ''

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>ql', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix [L]ist' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Other remaps
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- Remap
vim.keymap.set('n', '<Leader>o', 'o<Esc>k', { noremap = true, silent = true }) -- Insert a new line above the current line
vim.keymap.set('n', '<Leader>O', 'O<Esc>j', { noremap = true, silent = true }) -- Insert a new line below the current line

-- Faster navigation
vim.keymap.set({ 'n', 'v' }, '<C-j>', '5j', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-k>', '5k', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-h>', '5h', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-l>', '5l', { noremap = true, silent = true })

vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Creating new terminal in splits
vim.keymap.set(
  'n',
  '<leader>ip',
  '<cmd>vsplit | terminal zsh -i -c "conda activate py312 && ipython3"<CR> <cmd>setlocal nonumber norelativenumber<CR>i',
  { desc = '[I]nsert i[P]ython in terminal' }
)
vim.keymap.set(
  'n',
  '<leader>ij',
  '<cmd>vsplit | terminal zsh -i -c "julia --threads 4"<CR> <cmd>setlocal nonumber norelativenumber<CR>i',
  { desc = '[I]nsert [J]ulia in terminal' }
)
vim.keymap.set(
  'n',
  '<leader>ir',
  '<cmd>vsplit | terminal zsh -i -c "radian"<CR> <cmd>setlocal nonumber norelativenumber<CR>i',
  { desc = '[I]nsert [R] in terminal' }
)
vim.keymap.set(
  'n',
  '<leader>it',
  '<cmd>vsplit | terminal zsh -i -c "tree"<CR> <cmd>setlocal nonumber norelativenumber<CR>',
  { desc = '[I]nsert Directory [T]ree in terminal' }
)
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)

-- Navigating between splits
vim.keymap.set({ 'i', 't' }, '<C-w><C-h>', '<Esc> <C-w>h', { noremap = true, silent = true, buffer = true })
vim.keymap.set({ 'i', 't' }, '<C-w><C-l>', '<Esc> <C-w>l', { noremap = true, silent = true, buffer = true })
vim.keymap.set({ 'i', 't' }, '<C-w><C-j>', '<Esc> <C-w>j', { noremap = true, silent = true, buffer = true })
vim.keymap.set({ 'i', 't' }, '<C-w><C-k>', '<Esc> <C-w>k', { noremap = true, silent = true, buffer = true })

-- Send code to other buffers
vim.keymap.set('v', '<C-c><C-s>', 'y <C-w>l p <Esc> i', { desc = '[C]ode [S]end to right buffer', noremap = true, silent = true })
vim.keymap.set('n', '<C-c><C-s>', 'vip y <C-w>l p <Esc> i', { desc = '[C]ode [S]end to right buffer', noremap = true, silent = true })
vim.keymap.set('v', '<C-c><C-d>', 'y <C-w>j p <Esc> i', { desc = '[C]ode [S]end to down buffer', noremap = true, silent = true })
vim.keymap.set('n', '<C-c><C-d>', 'vip y <C-w>j p <Esc> i', { desc = '[C]ode [S]end to down buffer', noremap = true, silent = true })
