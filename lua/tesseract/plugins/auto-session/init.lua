local user_config = require('tesseract.core.user')
local u = require('tesseract.utils')

local defaults = {
  pre_save_cmds = { 'NvimTreeClose', 'cclose', 'lua vim.notify.dismiss()' },
  auto_session_enabled = true,
  auto_restore_enabled = true,
  auto_save_enabled = true,
}

return {
  'rmagatti/auto-session',
  lazy = false,
  config = function()
    require('auto-session').setup(u.merge(defaults, user_config.plugins.auto_session or {}))
  end,
  init = function()
    require('tesseract.plugins.auto-session.mappings')
  end,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'auto-session'),
}
