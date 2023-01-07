local user_config = require('tesseract.core.user')
local u = require('tesseract.utils')

local config = u.merge({

  -- use the night style
  style = 'night',
  light_style = 'moon',
  transparent = true,
  sidebars = { 'qf', 'packer', 'help' },
  on_colors = function(colors)
    colors.comment = '#bbc0d4'
  end,
  on_highlights = function(hl, c)
    hl.LineNr = {
      fg = '#606b9e'
    }

  end,
}, user_config.plugins.tokyonight or {})

return config
