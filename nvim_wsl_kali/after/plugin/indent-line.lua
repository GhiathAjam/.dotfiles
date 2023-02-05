vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.cmd [[highlight IndentBlanklineIndent7 guibg=#1f1f1f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent8 guibg=#1a1a1a gui=nocombine]]

require('indent_blankline').setup {
    show_end_of_line = true,
    space_char_blankline = ' ',
    show_trailing_blankline_indent = false,
    -- char = '│',
    -- char = '┊',
    -- char_list = {'▌', '│', '║'}
    -- let g:indent_blankline_context_char_list = ['┃', '║', '╬', '█']
    char_list = {'▏', '|', '¦', '┆', '┊', ''},

    -- 1 background
    -- char_highlight_list = {
    --     'IndentBlanklineIndent7',
    --     'IndentBlanklineIndent8',
    -- },
    -- space_char_highlight_list = {
    --     'IndentBlanklineIndent7',
    --     'IndentBlanklineIndent8',
    -- },

    -- 2 colorful
    char_highlight_list = {
      'IndentBlanklineIndent1',
      'IndentBlanklineIndent2',
      'IndentBlanklineIndent3',
      'IndentBlanklineIndent4',
      'IndentBlanklineIndent5',
      'IndentBlanklineIndent6',
    },

    -- 3 Treesitter
    show_current_context = false,
    show_current_context_start = true,
}

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

