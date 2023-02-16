vim.g.clipboard = {
  copy = {
    ['+'] = 'win32yank.exe -i --crlf',
    ['*'] = 'win32yank.exe -i --crlf',
  },
  paste = {
    ['+'] = 'win32yank.exe -o --lf',
    ['*'] = 'win32yank.exe -o --lf',
  },
}

vim.opt.makeprg = './%'

-- TRY
vim.opt.colorcolumn = '80'
-- menuone -> show menu even if single match
vim.opt.completeopt = { 'menuone', 'preview', 'noselect', 'noinsert' }

-- so that `` is visible in markdown files
vim.opt.conceallevel = 0

-- always show tabline
vim.opt.showtabline = 2

-- set number column width to 2 {default 4}
vim.opt.numberwidth = 3

-- faster completion
vim.opt.updatetime = 500

-- we went to hopsital 
-- check spelling of comments
vim.opt.spell = true

-- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.timeoutlen = 500

-- pop up menu height
-- pumheight = 10,
-- set the title of window to the value of the titlestring
vim.opt.title = true
-- what the title of the window will be set to
-- vim.opt.titlestring = '%<%F%=%l/%L - nvim'

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- width in spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
-- auto indentation with in spaces
vim.opt.shiftwidth = 2
-- expand to spaces
vim.opt.expandtab = true

-- autoindent + syntax
vim.opt.autoindent = true
vim.opt.smartindent = true

-- search options
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- better split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- TRUE COLORS
vim.opt.termguicolors = true

-- scroll off
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- no wrap
vim.opt.wrap = false

-- backup?
vim.opt.backup = false
vim.opt.swapfile = false

-- try
vim.opt.hidden = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.autowrite = true
vim.opt.undofile = true

-- show hidden characters
vim.opt.list = true
vim.opt.listchars = {
  -- space = '␣•·⋅',
  lead = ' ',
  tab = '→·',
  -- multispace = '---+'
  -- leadmultispace = '---+'
  extends  = '»',
  precedes = '«',
  -- conceal = '·',
  -- nbsp = '␣',
  space = '·',
  eol = '↴',
  trail = '•',
}

vim.opt.fillchars = {
  -- eob = ' ',
  -- diff = ' ',
  vert = ' ',
  -- fold = ' ',
  -- foldopen = '▾',
  -- foldsep = '│',
  -- foldclose = '▸',
}

vim.opt.signcolumn = 'yes'
vim.opt.viewoptions = 'folds,cursor'

-- treesitter based folding
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.opt.foldenable = false
-- vim.opt.foldminlines = 4
-- vim.opt.foldnestmax = 4

vim.opt.foldmethod = 'manual'

vim.g.mapleader = ' '
