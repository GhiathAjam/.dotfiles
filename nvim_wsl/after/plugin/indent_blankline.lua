local ok, indent_blankline = pcall(require, 'indent_blankline')
if not ok then
  vim.notify('indent_blankline plugin not found', vim.log.levels.WARN)
  return
end

indent_blankline.setup {
    show_end_of_line = true,
    space_char_blankline = ' ',
    show_trailing_blankline_indent = false,
    -- char = '│',
    -- char = '┊',
    -- char_list = {'▌', '│', '║'}
    -- let g:indent_blankline_context_char_list = ['┃', '║', '╬', '█']
    char_list = {'|', '¦', '┆', '┊', ''},

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
    show_current_context = true,
    show_current_context_start = true,
}

vim.cmd [[ let g:indent_blankline_context_char = '▏' ]]
