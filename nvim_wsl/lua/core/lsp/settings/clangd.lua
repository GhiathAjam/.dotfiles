return {
  settings = {
    cmd = {
      'clangd',
      -- '--background-index',
      -- '--pch-storage=memory',
      -- '--clang-tidy',
      -- '--all-scopes-completion',
      -- '--header-insertion=iwyu',
      -- '--header-insertion=never',
      -- '--suggest-missing-includes',
      -- '--cross-file-rename',
      -- '--completion-style=detailed',
      -- "clangd",
      "--background-index",
      "-j=12",
      "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
      "--clang-tidy",
      "--clang-tidy-checks=*",
      "--all-scopes-completion",
      "--cross-file-rename",
      "--completion-style=detailed",
      -- "--header-insertion-decorators",
      "--header-insertion=never",
      "--pch-storage=memory",
    },
    init_options = {
      -- clangdFileStatus = true,
      -- usePlaceholders = true,
      -- completeUnimported = true,
      -- semanticHighlighting = true,
      headerInsertion = 'never',
    },
    -- root_dir = root_pattern(
    --   '.clangd',
    --   '.clang-tidy',
    --   '.clang-format',
    --   'compile_commands.json',
    --   'compile_flags.txt',
    --   'configure.ac',
    --   '.git'
    -- )
    root_dir = '/home/gh/main',
  }
}
