
return {
	settings = {
    cmd = {
      'clangd',
      '--background-index',
      '--pch-storage=memory',
      '--clang-tidy',
      '--all-scopes-completion',
      '--header-insertion=iwyu',
      '--suggest-missing-includes',
      '--cross-file-rename',
      '--completion-style=detailed',
    },
    init_options = {
      clangdFileStatus = true,
      usePlaceholders = true,
      completeUnimported = true,
      semanticHighlighting = true,
    }
  }
}
