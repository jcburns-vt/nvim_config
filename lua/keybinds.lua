
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Window navigations
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Focus left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Focus lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Focus upper window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Focus right window' })

-- Diagnostic keymap
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal emulator/certain popups
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Clear highlights from search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Open NETRW
-- vim.keymap.set('n', '<leader>pv', ':Explore<CR>', { desc = 'Open NETRW file explorer' })

-- Insert mode bindings
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'AA', '<C-o>A')

-- Open Neo-Tree fullscreen
vim.keymap.set('n', '<leader>pv', ':Neotree position=current<CR>', {silent = true, desc = 'Open Neo-Tree'})

-- [ HARPOON ] --------------------------------------------------------------------------------------------------------
local harpoon = require('harpoon')

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {desc = 'Harpoon: [A]dd file'})
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = 'Harpoon: list'})

vim.keymap.set("n", "<leader>ha", function() harpoon:list():select(1) end, {desc = 'Focus file-1'})
vim.keymap.set("n", "<leader>hs", function() harpoon:list():select(2) end, {desc = 'Focus file-2'})
vim.keymap.set("n", "<leader>hd", function() harpoon:list():select(3) end, {desc = 'Focus file-3'})
vim.keymap.set("n", "<leader>hf", function() harpoon:list():select(4) end, {desc = 'Focus file-4'})

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<S-h>", function() harpoon:list():prev() end, {desc = 'Harpoon: select previous harpoon'})
vim.keymap.set("n", "<S-l>", function() harpoon:list():next() end, {desc = 'Harpoon: select next harpoon'})

-- [ FUZZY-FINDER ] ---------------------------------------------------------------------------------------------------

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })


