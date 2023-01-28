local opt = { noremap = true, silent = true }
local map = vim.keymap.set

map('n', '<leader>x', function() print 'hii' end, opt)

-- map leader e to open explorer
-- Open Explorer to the right, set edits to first window!
map('n', '<leader>e', ':Lexplore! 33<CR>:let g:netrw_chgwin=1<CR>', opt)

-- packer -> waste of keys!
-- map('n', '<leader>ps', vim.cmd.PackerSync, opt)

-- source, write, quit
map('n', '<leader>so', vim.cmd.source, opt)
map('n', '<leader>w', vim.cmd.write, opt)
map('n', '<leader>q', vim.cmd.quit, opt)


-- map('n', '<F2>', '<Plug>VimspectorToggleBreakpoint <CR>', opt)
-- map('n', '<F4>', ':VimspectorReset <CR>', opt)
-- map('n', '<F5>', '<Plug>VimspectorContinue <CR>', opt)
-- map('n', '<F6>', '<Plug>VimspectorStepOver <CR>', opt)
-- map('n', '<F7>', '<Plug>VimspectorStepInto <CR>', opt)
-- map('n', '<F8>', '<Plug>VimspectorStepOut <CR>', opt)

-- beter window navigation
map('n', '<c-h>', '<c-w>h', opt)
map('n', '<c-j>', '<c-w>j', opt)
map('n', '<c-k>', '<c-w>k', opt)
map('n', '<c-l>', '<c-w>l', opt)

-- BUFFERS
map('n', '<s-h>', vim.cmd.bprevious, opt)
map('n', '<s-l>', vim.cmd.bnext, opt)

-- ESC
map('i', 'jk', '<ESC>', opt)
map('i', 'kj', '<ESC>', opt)
map('i', '<C-c>', '<ESC>', opt)

-- better J
map('n', 'J', 'mzJ`z', opt)

-- CENTER STUFF
map('n', '<C-d>', '<C-d>zz', opt)
map('n', '<C-u>', '<C-u>zz', opt)
map('n', 'n', 'nzz', opt)
map('n', 'N', 'Nzz', opt)

-- don't ruin the buffer
map('x', '<leader>vp', '"_dP', opt)
map('n', '<leader>vd', '"_d', opt)
map('v', '<leader>vd', '"_d', opt)

-- clipbard
-- y
map('n', '<leader>y', '"+y', opt)
map('v', '<leader>y', '"+y', opt)
map('n', '<leader>Y', '"+Y', opt)
map('v', '<leader>Y', '"+Y', opt)
-- p
map('n', '<leader>p', '"+p', opt)
map('v', '<leader>p', '"+p', opt)
map('n', '<leader>P', '"+P', opt)
map('v', '<leader>P', '"+P', opt)
-- d
map('n', '<leader>d', '"+d', opt)
map('v', '<leader>d', '"+d', opt)
map('n', '<leader>D', '"+D', opt)
map('v', '<leader>D', '"+D', opt)
-- c
map('n', '<leader>c', '"+c', opt)
map('v', '<leader>c', '"+c', opt)
map('n', '<leader>C', '"+C', opt)
map('v', '<leader>C', '"+C', opt)


-- drag lines
-- insert
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opt)
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opt)
-- normal
map('n', '<A-k>', ' :m .-2<CR>==', opt)
map('n', '<A-j>', ' :m .+1<CR>==', opt)
-- visual!
map('x', '<A-k>', ':m \'<-2<CR>gv=gv', opt)
map('x', '<A-j>', ':m \'>+1<CR>gv=gv', opt)

-- indent
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)

-- resize
map('n', '<c-right>', ':vert res +2<CR>', opt)
map('n', '<c-left>', ' :vert res -2<CR>', opt)
map('n', '<c-up>', '   :res +3<CR>', opt)
map('n', '<c-down>', ' :res -3<CR>', opt)

-- clear line
-- nnoremap <c-k> cc<ESC>

-- ultisnips
-- let g:UltiSnipsExpandTrigger='<c-m>'
-- let g:UltiSnipsJumpForwardTrigger='<c-b>'
-- let g:UltiSnipsJumpBackwardTrigger='<c-z>'

map('n', '<F9>', ':make! <CR>', opt)

-- LSP Mappings.
-- map('n', '[d', vim.diagnostic.goto_prev, opts)
-- map('n', ']d', vim.diagnostic.goto_next, opts)
-- map('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

-- MACROS
--  delete alternate line, for copy paste madness
