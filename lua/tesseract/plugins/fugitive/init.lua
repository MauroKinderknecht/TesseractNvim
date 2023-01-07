local user_config = require('tesseract.core.user')
return {
  'tpope/vim-fugitive',
  cmd = 'Git',
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'fugitive'),
}
