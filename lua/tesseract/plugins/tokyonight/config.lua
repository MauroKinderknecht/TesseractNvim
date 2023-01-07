local user_config = require('tesseract.core.user')
local u = require('tesseract.utils')

local config = u.merge({

  -- use the night style
  style = 'night',
  light_style = 'moon',
  transparent = true,
  sidebars = { 'qf', 'packer', 'help' },
}, user_config.plugins.tokyonight or {})

return config
