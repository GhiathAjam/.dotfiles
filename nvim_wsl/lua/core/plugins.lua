local ensure_packer = function()
  local fn = vim.fn
  local install_path =
      fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify('INSTALLING PACKER', vim.log.levels.INFO)
    fn.system({ 'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim', install_path })
    -- vim.cmd [[packadd packer.nvim]]
    -- vim.cmd [[ packloadall! ]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

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

  -- Universal dependencies
  use {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
  }
  use 'folke/neodev.nvim'

  -- LSP, DAP & Linters
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  -- use 'folke/lsp-colors.nvim'

  -- LSP diagnostics and code actions
  -- use 'jose-elias-alvarez/null-ls.nvim'
  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown',
  --     'racket', 'vim', 'tex'},
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]'
  -- }

  use {
    'mfussenegger/nvim-dap',
    'theHamsta/nvim-dap-virtual-text',
    'rcarriga/nvim-dap-ui',
  }

  use {
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      -- or                            , branch = '0.1.x',
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    -- { 'ghassan0/telescope-glyph.nvim' },
    { 'nvim-telescope/telescope-symbols.nvim' },
    -- https://github.com/nvim-telescope/telescope-frecency.nvim
    {
      'nvim-telescope/telescope-frecency.nvim',
      requires = { 'kkharji/sqlite.lua' }
    },
    -- { 'gbrlsnchs/telescope-lsp-handlers.nvim' },
    {
      'AckslD/nvim-neoclip.lua',
      requires = {
        { 'kkharji/sqlite.lua',           module = 'sqlite' },
        { 'nvim-telescope/telescope.nvim' },
      },
    },
    -- { 'axkirillov/easypick.nvim' },
    -- { 'octarect/telescope-menu.nvim' },
    -- { 'debugloop/telescope-undo.nvim' },
    -- { 'nvim-telescope/telescope-packer.nvim' },
  }
  -- use 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
  -- Plug 'junegunn/fzf.vim'
  -- https://github.com/ibhagwan/fzf-lua


  use 'ThePrimeagen/vim-be-good'
  -- use 'jacoborus/tender.vim'

  -- Statusline
  use 'nvim-lualine/lualine.nvim'

  -- Treesitter Related
  use {
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    'HiPhish/nvim-ts-rainbow2',
    -- 'nvim-treesitter/nvim-treesitter-refactor' -- vim illuminate is better,
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'andymass/vim-matchup',
  }
  -- LSP, Tree-sitter, or regex matching.
  use 'RRethy/vim-illuminate'

  use 'ThePrimeagen/harpoon'

  use 'mbbill/undotree'

  use { 'nvim-tree/nvim-tree.lua', tag = 'nightly' }

  -- Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  -- Multiple Plug commands can be written in a single line using | separators
  -- Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

  -- Auto Completion
  -- Nvim CMP
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'saadparwaiz1/cmp_luasnip' },
      -- Digraphs :(
      { 'dmitmel/cmp-digraphs' },
    },
  }

  -- COC nvim
  -- use { 'neoclide/coc.nvim', branch = 'release' }

  -- COQ
  -- main
  -- use {
  --   'ms-jpq/coq.nvim',
  --   branch = 'coq',
  --   requires = {
  --     -- 9000+ Snippets
  --     { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
  --     -- lua & third party sources
  --     -- See https://github.com/ms-jpq/coq.thirdparty
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

  -- You Complete Me
  -- Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

  -- ########
  -- Copilot
  -- ########
  use 'zbirenbaum/copilot.lua'
  -- use {
  --   'zbirenbaum/copilot-cmp',
  --   after = { 'copilot.lua', 'nvim-cmp' },
  -- }

  -- alternatives
  -- use 'Exafunction/codeium.vim'

  use 'junegunn/vim-easy-align'

  -- Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

  use 'tpope/vim-surround'

  -- use 'jiangmiao/auto-pairs'
  -- conservative auto pairs, only on ENTER
  -- use 'rstacruz/vim-closer'

  use 'numToStr/Comment.nvim'
  use 'lukas-reineke/indent-blankline.nvim'

  -- Debuggeer
  -- use 'puremourning/vimspector'

  -- Colors
  use {
    -- lock as I modified its source lol
    {
      'LunarVim/onedarker.nvim',
      branch = 'freeze',
      as = 'lvim_onedarker',
      lock = true
    },
    { 'LunarVim/onedarker.nvim', }
  }

  use { "akinsho/toggleterm.nvim", tag = '*' }

  -- Visuals
  use 'norcalli/nvim-colorizer.lua'
  use 'petertriho/nvim-scrollbar'

  -- minimap
  -- Plug 'wfxr/minimap.vim'

  -- Building / Running
  -- use {
  --   'tpope/vim-dispatch',
  --   opt = true,
  --   cmd = { 'Dispatch', 'Make', 'Focus', 'Start' }
  -- }

  -- use {
  --   'iamcco/markdown-preview.nvim',
  --   run = 'cd app && yarn install',
  --   cmd = 'MarkdownPreview'
  -- }

  -- use {
  --   'glacambre/firenvim',
  --   run = function() vim.fn['firenvim#install'](0) end
  -- }

  use 'jalvesaq/Nvim-R'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
