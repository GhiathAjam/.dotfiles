-- vim.cmd [[ colorscheme gruvbox ]]
vim.cmd [[ colorscheme lvim_onedarker ]]

vim.cmd [[ hi VertSplit guifg=#444444 guibg=#282c34 ]]

-- colorscheme monokai-phoenix
-- hi MatchParen guifg=#E0E0E0 guibg=#E0E0E0
-- fix bad matching parenthesis!
-- ( { [  ] } )

local colors = {
  blue   = '#61afef',
  green  = '#98c379',
  purple = '#c678dd',
  cyan   = '#56b6c2',
  red1   = '#e06c75',
  red2   = '#be5046',
  yellow = '#e5c07b',
  fg     = '#abb2bf',
  bg     = '#282c34',
  gray1  = '#828997',
  gray2  = '#2c323c',
  gray3  = '#3e4452',
}

local onedarker = {
  normal = {
    a = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.gray3 },
    c = { fg = colors.fg, bg = colors.gray2 },
  },
  command  = { a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' } },
  insert   = { a = { fg = colors.bg, bg = colors.green,  gui = 'bold' } },
  visual   = { a = { fg = colors.bg, bg = colors.purple, gui = 'bold' } },
  terminal = { a = { fg = colors.bg, bg = colors.cyan,   gui = 'bold' } },
  replace  = { a = { fg = colors.bg, bg = colors.red1,   gui = 'bold' } },
  inactive = {
    a = { fg = colors.gray1, bg = colors.bg--[[ , gui = 'bold' ]] },
    b = { fg = colors.gray1, bg = colors.bg },
    c = { fg = colors.gray1, bg = colors.gray2 },
  },
}

require('lualine').setup { options = { theme = onedarker } }

-- vim.cmd [[ hi clear GitSignsAdd ]]
-- vim.cmd [[ hi clear GitSignsChange ]]
-- vim.cmd [[ hi clear GitSignsDelete ]]

-- vim.cmd [[ highlight GitSignsAdd guifg=#00CF00 ]]
-- vim.cmd [[ highlight GitSignsChange guifg=#CFCF00 ]]
-- vim.cmd [[ highlight GitSignsDelete guifg=#CF0000 ]]

-- vim.cmd [[ hi clear DiffAdd ]]
-- vim.cmd [[ hi clear DiffChange ]]

-- vim.cmd [[ highlight DiffAdd guibg=#213020 ]]
-- vim.cmd [[ highlight DiffChange guibg=#202000 ]]

-- highlight all diagnostic virtual text with darker colors
vim.cmd [[ hi DiagnosticVirtualTextError guifg=#A00000 gui=nocombine gui=italic ]]
vim.cmd [[ hi DiagnosticVirtualTextWarn  guifg=#B09040 gui=nocombine gui=italic ]]
vim.cmd [[ hi DiagnosticVirtualTextInfo  guifg=#509050 gui=nocombine gui=italic ]]
vim.cmd [[ hi DiagnosticVirtualTextHint  guifg=#3070a0 gui=nocombine gui=italic ]]

-- make diagnostic info sign green
vim.cmd [[ hi DiagnosticSignInfo guifg=#509050 gui=nocombine gui=bold ]]
-- make all diagnostic signs bold, same colors
vim.cmd [[ hi DiagnosticSignError gui=nocombine gui=bold ]]
vim.cmd [[ hi DiagnosticSignWarn  gui=nocombine gui=bold ]]
vim.cmd [[ hi DiagnosticSignInfo  gui=nocombine gui=bold ]]
vim.cmd [[ hi DiagnosticSignHint  gui=nocombine gui=bold ]]

vim.cmd [[ hi clear SpellBad ]]
vim.cmd [[ hi clear SpellCap ]]
vim.cmd [[ hi clear SpellRare ]]
vim.cmd [[ hi clear SpellLocal ]]
vim.cmd [[ hi SpellBad gui=strikethrough ]]
-- hopstial

vim.cmd [[ highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent7 guibg=#1f1f1f gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent8 guibg=#1a1a1a gui=nocombine ]]

if true then
  if false then
    if false then
      if true then
        if false then
          if false then
            print 'hii'





            print 'ee'
          end
        end
      end
    end
  end
end
