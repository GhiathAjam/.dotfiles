--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = false
lvim.colorscheme = "onedarker"

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = false
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.treesitter.indent.enable=false

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  -- {'junegunn/fzf', {'do': { -> fzf#install() }}}
  --'norcalli/nvim-colorizer.lua'
  --'github/copilot.vim'
  --'jiangmiao/auto-pairs'
  --'tpope/vim-commentary'
  --'tpope/vim-surround'

  --     {
  --       "folke/trouble.nvim",
  --       cmd = "TroubleToggle",
  --     },

-- code auto completion
  --'neovim/nvim-lspconfig'
  --'ms-jpq/coq.nvim', {'branch': 'coq'}
  --'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

-- Debuggeer
--   --'mfussenegger/nvim-dap'
  --'puremourning/vimspector'

-- Colors
--   --'flazz/vim-colorschemes'
  --'Reewr/vim-monokai-phoenix'
  --'vim-airline/vim-airline'
  --'vim-airline/vim-airline-themes'

-- blocks
  --'Yggdroot/indentLine'
-- icons
  --'ryanoasis/vim-devicons'
-- minimap
  --'wfxr/minimap.vim'

    -- {"lunarvim/colorschemes"},
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
}


-- terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "startinsert"
})

-- load template
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  -- command =  'vim.api.nvim_buf_create_user_command("Tmp", "%d| re ~/Desktop/tmp.cpp| 1,1d| :normal 44j$zz", {})'
  -- command = "command! Tmp %d| re ~/Desktop/tmp.cpp| 1,1d| :normal 44j$zz :LspRestart clangd"
  command = "command! Tmp %d| re ~/Desktop/tmp.cpp| 1,1d| :normal 44j$zz"
})

-- fuzzy search templates!
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function ()
  end
})


-- compile
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  command = "nnoremap <F9> :w <CR> :1000sp <bar> :term g++ -g -fdiagnostics-color -Wall -Wextra -pedantic -Wshadow -Wformat=2  -Wfloat-equal -Wconversion -Wlogical-op  -Wshift-overflow=2 -Wduplicated-cond  -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG  -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2  -fstack-protector -D LLOC -std=c++20 % -o %:h/_%:t:r <CR><CR>"
})

-- run
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  command = "nnoremap <F10> :!%:h/_%:t:r  <CR>"
})

-- fuzzy search documentation!
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  command = "nnoremap <F1> :1000sp <bar> :term cpref.sh <CR>"
})

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--
--

-- clipboard stuff
vim.opt.clipboard=""
if vim.fn.has "wsl" == 1 then
  vim.g.clipboard =
  {
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
  }
end


-- Many LunarVim internal settings are exposed through the lvim global object.
-- To see a list of all available settings,
-- run this command from either ~/.config/lvim/ or ~/.local/share/lunarvim/lvim to generate an lv-settings.lua file.

-- lvim --headless +'lua require("lvim.utils").generate_settings()' +qa && sort -o lv-settings.lua{,}
