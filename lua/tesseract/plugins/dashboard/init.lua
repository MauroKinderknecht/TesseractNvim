local user_config = require('tesseract.core.user')

return {
  'glepnir/dashboard-nvim',
  config = function()
    require('tesseract.plugins.dashboard.config')
  end,
  event = 'VimEnter',
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'dashboard'),
}