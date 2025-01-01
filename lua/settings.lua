
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')

vim.opt.number = true
vim.opt.relativenumber = true

-- Preview substitutions
vim.opt.inccommand = 'split'

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.showmode = false

-- Display floating error/warning messages in editor
vim.diagnostic.config { virtual_text = true }

-- Visually indicates certain whitespace characters in the editor
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Sync yank and system clipboards
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('hightlight_yank', { clear = true }),
  desc = 'Hightlight selection on yank',
  callback = function()
    vim.highlight.on_yank()
  end,
})
