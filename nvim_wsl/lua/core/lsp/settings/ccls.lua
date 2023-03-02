return {
  -- root_dir = root_pattern('compile_commands.json', '.ccls', '.git'),
  offsetEncoding = 'utf-8',
  init_options = {
    -- compilationDatabaseDirectory = 'build',
    -- index = {
    --   threads = 0;
    -- },
    offsetEncoding = 'utf-8',
    cache = {
      directory = '.ccls-cache',
    },
    clang = {
      excludeArgs = { '-frounding-math', '-Wconversion' } ,
    },
    completion = {
      filterAndSort = false,
    },
  }
}
