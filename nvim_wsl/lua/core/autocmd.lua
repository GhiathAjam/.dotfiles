-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'zsh',
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require('nvim-treesitter.highlight').attach(0, 'bash')
--   end,
-- })

local myg = vim.api.nvim_create_augroup('user', { clear = true })
vim.api.nvim_clear_autocmds({ group = myg })

-- colorscheme
vim.api.nvim_create_autocmd('VimEnter', {
  group = myg,
  callback = function() vim.defer_fn(function() require('core.colors') end, 0) end,
  -- command = 'colorscheme onedarker'
})

-- views for folds
vim.api.nvim_create_autocmd('BufWinEnter', {
  group = myg,
  pattern = { '*.c', '*.h', '*.cpp', '*.txt', '*.vim', '*.lua' },
  command = 'silent! loadview',
})

vim.api.nvim_create_autocmd('BufWinLeave', {
  group = myg,
  pattern = { '*.c', '*.h', '*.cpp', '*.txt', '*.vim', '*.lua' },
  command = 'mkview',
})

-- formatoptions FIX
vim.api.nvim_create_autocmd('FileType', {
  group = myg,
  pattern = '*',
  callback = function()
    -- :h fo-table
    -- default: jcroql
    -- -= 'cro'
    -- vim.opt.formatoptions:remove { 'c', 'r', 'o' }
    vim.opt.formatoptions:remove { 'c', 'o' }
    end,
})

-- -- Copilot
-- vim.api.nvim_create_autocmd('FileType', {
--   group = myg,
--   pattern = '*',
--   command = 'Copilot'
-- })

-- Yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = myg,
  callback = function()
    vim.highlight.on_yank { higroup='IncSearch', timeout=150 }
  end
})

-- Terminal mode
vim.api.nvim_create_autocmd('TermOpen', {
  group = myg,
  pattern = '*',
  command = 'startinsert'
})

-- python
vim.api.nvim_create_autocmd('FileType', {
  group = myg,
  pattern = 'python',
  callback = function()
    vim.opt_local.makeprg = [[python3 %]]
  end
})

-- cpp
-- vim.api.nvim_create_autocmd('FileType', {
--   group = myg,
--   pattern = 'cpp',
--   command = 'setlocal commentstring=//%s',
-- })

-- load template
-- autocmd local to buffer in cpp files
vim.api.nvim_create_autocmd('FileType', {
  group = myg,
  pattern = 'cpp',
  command = ':command! -buffer Tmp %d| 0read ~/Desktop/tmp.cpp| 11,19fo| 33,46fo| 47d| :normal 28Gzz'
})

-- compile
vim.api.nvim_create_autocmd('FileType', {
  group = myg,
  pattern = 'cpp',
  callback = function()
    vim.opt_local.makeprg = [[g++ -g -Wunused-macros -Wstack-usage=12345678\\
    -Wuninitialized -fmax-errors=1 -fsanitize=pointer-subtract\\
    -fsanitize=pointer-compare -fno-sanitize-recover -fsanitize=address\\
    -fsanitize=undefined -Wno-variadic-macros -Wall -Wextra -pedantic\\
    -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op\\
    -Wshift-overflow=2 -Wduplicated-branches -Wduplicated-cond -Wcast-qual\\
    -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_ASSERTIONS\\
    -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fstack-protector -D LLOC\\
    -std=c++20 % -o %:h/%:t:r 2>&1 \| head -n28]]
  end
})

-- run
vim.api.nvim_create_autocmd('FileType', {
  group = myg,
  pattern = 'cpp',
  command = 'nnoremap <buffer> <F10> :!%:h/%:t:r <./input.txt > ./output.txt <CR>'
})

-- run interactively
vim.api.nvim_create_autocmd('FileType', {
  group = myg,
  pattern = 'cpp',
  command = 'nnoremap <buffer> <F11> :!%:h/_%:t:r <CR>'
})

-- fuzzy search documentation!
vim.api.nvim_create_autocmd('FileType', {
  group = myg,
  pattern = 'cpp',
  command = 'nnoremap <buffer> <F1> :1000sp <bar> :term cpref.sh <CR>'
})

-- fuzzy search templates!
-- autocmd filetype cpp :command :T
-- submit hh
vim.api.nvim_create_autocmd('FileType', {
  group = myg,
  pattern = 'cpp',
  command = ':command! -buffer -nargs=+ Cfsubmit :!cf.exe submit -f % <args> <CR>'
})
