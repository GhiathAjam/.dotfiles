vim.g.clipboard = {
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
}


vim.opt.makeprg = './%'

-- TRY
vim.opt.colorcolumn = '80'
-- vim.opt.completeopt = { 'menuone', 'preview', 'noinsert', 'noselect' }
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files

vim.opt.showtabline = 2

vim.opt.numberwidth = 3 -- set number column width to 2 {default 4}

vim.opt.updatetime = 500 -- faster completion

-- set wildmode=longest,list   " get bash-like tab completions
-- set spell
    -- If you exit Vim and later start it again, you would normally lose a lot of
    -- information.  The ShaDa file can be used to remember that information, which
    -- enables you to continue where you left off.  Its name is the abbreviation of
    -- SHAred DAta because it is used for sharing data between Neovim sessions.

    -- writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    -- timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
    -- pumheight = 10, -- pop up menu height
    -- title = true, -- set the title of window to the value of the titlestring
    -- -- opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to


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

-- show tabs and tralining spaces
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:remove "eol"
vim.opt.listchars:append "eol:↴"

vim.opt.signcolumn = 'yes'
vim.opt.viewoptions = 'folds,cursor'

-- treesitter based folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
vim.opt.foldminlines = 4
vim.opt.foldnestmax = 4

vim.g.mapleader = " "

vim.cmd 'colorscheme tokyonight-night' 
-- colorscheme monokai-phoenix
-- hi MatchParen guifg=#E0E0E0 guibg=#E0E0E0
-- fix bad matchign paren!
-- ( { [  ] } )
