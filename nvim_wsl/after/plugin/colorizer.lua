local ok, colorizer = pcall(require, 'colorizer')
if not ok then
  vim.notify('colorizer plugin not found', vim.log.levels.WARN)
  return
end

colorizer.setup (
  {
  },
  -- second argument is default options
  {
    RGB      = false,         -- #RGB hex codes
    RRGGBB   = true,         -- #RRGGBB hex codes
    names    = true,         -- "Name" codes like Blue
    RRGGBBAA = false,        -- #RRGGBBAA hex codes
    rgb_fn   = false,        -- CSS rgb() and rgba() functions
    hsl_fn   = false,        -- CSS hsl() and hsla() functions
    css      = false,        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn   = false,        -- Enable all CSS *functions*: rgb_fn, hsl_fn
    -- Available modes: foreground, background
    mode     = 'background', -- Set the display mode.
  }
)
