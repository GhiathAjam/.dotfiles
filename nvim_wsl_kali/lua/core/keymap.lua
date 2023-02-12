local opt = { noremap = true, silent = true }
local map = vim.keymap.set

map('n', '<leader>x', function() print 'hii' end, opt)

local _, builtin = pcall(require, 'telescope.builtin')
if _ then
  map('n', '<leader>ff', builtin.find_files, opt)
  map('n', '<leader>fg', builtin.live_grep, opt)
  -- map('n', '<leader>fs', builtin.grep_string, opt)
  map('n', '<leader>fb', builtin.buffers, opt)
  map('n', '<leader>fh', builtin.help_tags, opt)
  map('n', '<leader>fc', builtin.colorscheme, opt)
end

local ok, dap = pcall(require, 'dap')
local ok2, _ = pcall(require, 'dapui')
if ok then
  map('n', '<F2>', dap.toggle_breakpoint, opt)
  -- conditional breakpoint
  map('n', '<leader>B', ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint Condition: "))<CR>', opt)
  -- map('n', '<leader>C', ':lua require("dap").set_breakpoint(nil, vim.fn.input("Brekpoint hit count: "))<CR>', opt)
  map('n', '<F4>', dap.terminate, opt)
  map('n', '<F5>', dap.continue, opt)
  map('n', '<F6>', dap.step_over, opt)
  map('n', '<F7>', dap.step_into, opt)
  map('n', '<F8>', dap.step_out, opt)
  if ok2 then
    -- map('v', '<F3>', require('dapui').eval, opt)
  end
end

-- map leader e to open explorer
-- Open Explorer to the right, set edits to first window!

-- check if nvim-tree is installed
if pcall(require, 'nvim-tree') then
  map('n', '<leader>e', ':NvimTreeToggle<CR>', opt)
else
  map('n', '<leader>e', ':Lexplore! 33<CR>:let g:netrw_chgwin=1<CR>', opt)
end

-- Terminal Mode
map('t', '<leader>x', [[ <C-\><C-n> ]], opt)
map('t', '<esc>', [[<C-\><C-n>]], opt)
map('t', 'jk', [[<C-\><C-n>]], opt)
map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opt)
map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opt)
map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opt)
map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opt)

-- packer -> waste of keys!
-- map('n', '<leader>ps', vim.cmd.PackerSync, opt)

-- source, write, quit
map('n', '<leader>so', function() vim.cmd.write() vim.cmd.source() end, opt)
map('n', '<leader>w', vim.cmd.write, opt)
map('n', '<leader>q', vim.cmd.quit, opt)


-- better window navigation
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

map('n', '[q,', ':cprevious<CR>', opt)
map('n', ']q,', ':cnext<CR>', opt)
