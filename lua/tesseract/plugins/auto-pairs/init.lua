local user_config = require('tesseract.core.user')
local u = require('tesseract.utils')

return {
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup(u.merge({
      check_ts = true,
      ts_config = {
        lua = { 'string', 'source' },
        javascript = { 'string', 'template_string' },
        java = false,
      },
      disable_filetype = { 'TelescopePrompt', 'vim' },
      fast_wrap = {},
    }, user_config.plugins.nvim_autopairs or {}))
  end,
  enabled = not vim.tbl_contains(user_config.disable_builtin_plugins, 'autopairs'),
}
