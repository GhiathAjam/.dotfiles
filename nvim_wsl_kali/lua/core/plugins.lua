
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local packer = require 'packer'

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }

  use { 'mfussenegger/nvim-dap' }
  use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }
  use { 'theHamsta/nvim-dap-virtual-text' }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }


  use 'ThePrimeagen/vim-be-good'
  -- use 'jacoborus/tender.vim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'HiPhish/nvim-ts-rainbow2'
  -- use 'nvim-treesitter/nvim-treesitter-refactor' -- vim illuminate is better
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'andymass/vim-matchup'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use 'RRethy/vim-illuminate'

  use {
    'ThePrimeagen/harpoon',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'mbbill/undotree'

  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- code auto completion
  use 'neovim/nvim-lspconfig'

  -- COQ
  -- main
  -- use {
  --   'ms-jpq/coq.nvim',
  --   branch = 'coq',
  --   requires = {
  --     -- 9000+ Snippets
  --     { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
  --     -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
  --     -- Need to **configure separately**
  --     -- shell repl
  --     -- nvim lua api
  --     -- scientific calculator
  --     -- comment banner
  --     -- copilot
  --     -- etc
  --     { 'ms-jpq/coq.thirdparty', branch = '3p' },
  --   },
  -- }

  -- nvim-cmp
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'dmitmel/cmp-digraphs' },
    },
  }

  use 'folke/neodev.nvim'

  -- use { 'neoclide/coc.nvim', branch = 'release' }

  -- Snippets
  use 'rafamadriz/friendly-snippets'

  use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions

  -- Copilot
  use {
    'zbirenbaum/copilot.lua',
    -- cmd = 'Copilot',
    -- event = 'InsertEnter',
    -- config = function()
    --   vim.schedule(function()
    --     require('copilot').setup()
    --   end)
    -- end,
  }

  use {
    'zbirenbaum/copilot-cmp',
    after = { 'copilot.lua', 'nvim-cmp' },
  }

  use 'junegunn/vim-easy-align'

  -- Multiple Plug commands can be written in a single line using | separators
  -- Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

  -- On-demand loading
  -- Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  -- Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

  -- Using a non-default branch
  -- Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
  -- you complete me config generator

  -- use 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
  -- Plug 'junegunn/fzf.vim'

  -- Unmanaged plugin (manually installed and updated)
  -- Plug '~/my-prototype-plugin'

  use 'norcalli/nvim-colorizer.lua'
  -- use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'

  use 'numToStr/Comment.nvim'
  use 'lukas-reineke/indent-blankline.nvim'

  -- Debuggeer
  -- use 'puremourning/vimspector'

  -- Colors
  use {
    -- 'morhetz/gruvbox',
    'ellisonleao/gruvbox.nvim',
    event = 'VimEnter',
    config = function()
     require('core.gruvbox')
    end,
  }

  use 'petertriho/nvim-scrollbar' 

  -- Statusline

  -- blocks
  -- use 'ryanoasis/vim-devicons'
  -- minimap
  -- Plug 'wfxr/minimap.vim'

--  -- Simple plugins can be specified as strings
--  use 'rstacruz/vim-closer'
--
--  -- Lazy loading:
--  -- Load on specific commands
--  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
--
--  -- Load on an autocommand event
--  use {'andymass/vim-matchup', event = 'VimEnter'}
--
--  -- Load on a combination of conditions: specific filetypes or commands
--  -- Also run code after load (see the 'config' key)
--  use {
--    'w0rp/ale',
--    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
--    cmd = 'ALEEnable',
--    config = 'vim.cmd[[ALEEnable]]'
--  }
--
--  -- Plugins can have dependencies on other plugins
--  use {
--    'haorenW1025/completion-nvim',
--    opt = true,
--    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
--  }
--
--  -- Plugins can also depend on rocks from luarocks.org:
--  use {
--    'my/supercoolplugin',
--    rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
--  }
--
--  -- You can specify rocks in isolation
--  use_rocks 'penlight'
--  use_rocks {'lua-resty-http', 'lpeg'}
--
--  -- Local plugins can be included
--  use '~/projects/personal/hover.nvim'
--
--  -- Plugins can have post-install/update hooks
--  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
--
--
--  -- Post-install/update hook with call of vimscript function with argument
--  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
--
--  -- Use specific branch, dependency and run lua file after load
--  use {
--    'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
--    requires = {'kyazdani42/nvim-web-devicons'}
--  }
--
--  -- Use dependency and run lua function after load
--  use {
--    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
--    config = function() require('gitsigns').setup() end
--  }
--
--  -- You can specify multiple plugins in a single call
--  use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}
--
end)
