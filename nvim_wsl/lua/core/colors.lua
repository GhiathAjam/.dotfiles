local ok1, _ = pcall(require, 'lvim_onedarker')
local ok2, _ = pcall(require, 'onedarker')

if ok1 then
  vim.cmd [[ colorscheme lvim_onedarker ]]
elseif ok2 then
  vim.cmd [[ colorscheme onedarker ]]
end

vim.cmd [[ hi VertSplit guifg=#444444 guibg=#282c34 ]]

vim.cmd [[ hi Macro     guifg=#FFFFFF gui=italic ]]

-- colorscheme monokai-phoenix
-- hi MatchParen guifg=#E0E0E0 guibg=#E0E0E0
-- fix bad matching parenthesis!
-- ( { [  ] } )

local colors = {
  blue    = '#61afef',
  blue2   = '#304050',
  green   = '#98c379',
  green2  = '#304030',
  purple  = '#c678dd',
  purple2 = '#403040',
  cyan    = '#56b6c2',
  cyan2   = '#304040',
  red1    = '#e06c75',
  red2    = '#403030',
  yellow  = '#e5c07b',
  yellow2 = '#404030',
  fg      = '#abb2bf',
  bg      = '#282c34',
  gray1   = '#828997',
  gray2   = '#3e4452',
  black   = '#000000',
}


local onedarker = {  
  normal   = {
    a = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.black },
    c = { fg = colors.fg, bg = colors.blue2 },
  },
  command  = {
    a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
    c = { bg = colors.yellow2 },
  },
  insert   = {
    a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
    c = { bg = colors.green2 },
  },
  visual   = {
    a = { fg = colors.bg, bg = colors.purple, gui = 'bold' },
    c = { bg = colors.purple2 },
  },
  terminal = {
    a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' },
    c = { bg = colors.cyan2 },
  },
  replace  = {
    a = { fg = colors.bg, bg = colors.red1, gui = 'bold' },
    c = { bg = colors.red2 },
  },
  inactive = {
    a = { fg = colors.gray1, bg = colors.bg --[[ , gui = 'bold' ]] },
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

-- Add bold to DiffAdd as all Diff* are also bold
vim.cmd [[ hi DiffAdd gui=bold ]]

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

-- the bar on side
vim.cmd [[ highlight IndentBlanklineContextChar guifg=#000000 ]]
-- the underline
-- vim.cmd [[ highlight IndentBlanklineContextStart gui=underline guisp=#00ff00 ]]
vim.cmd [[ highlight IndentBlanklineContextStart gui=underline guibg=#000000 ]]

-- don't know what this does lol
-- vim.cmd [[ highlight IndentBlanklineContextSpaceChar guifg=#00FF00 gui=nocombine ]]

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
