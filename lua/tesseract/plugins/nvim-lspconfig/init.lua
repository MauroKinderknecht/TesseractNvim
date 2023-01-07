local user_config = require('tesseract.core.user')

return {
  'neovim/nvim-lspconfig',
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'nvim-lspconfig'),
}
