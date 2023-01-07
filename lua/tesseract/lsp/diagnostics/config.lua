local u = require('tesseract.utils')
local icons = require('tesseract.utils.icons')
local user_config = require('tesseract.core.user')

local function format_diagnostic(diagnostic)
  local icon = icons.error
  if diagnostic.severity == vim.diagnostic.severity.WARN then
    icon = icons.warn
  end

  if diagnostic.severity == vim.diagnostic.severity.HINT then
    icon = icons.hint
  end

  local message = string.format(' %s [%s][%s] %s', icon, diagnostic.code, diagnostic.source, diagnostic.message)
  return message
end

local config = u.merge({
  underline = true,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = user_config.border,
    focusable = false,
    header = { icons.debug .. ' Diagnostics:', 'Normal' },
    scope = 'line',
    source = false,
    format = format_diagnostic,
  },
  virtual_text = {
    prefix = '•',
    spacing = 2,
    source = false,
    severity = {
      min = vim.diagnostic.severity.HINT,
    },
    format = format_diagnostic,
  },
}, user_config.diagnostic or {})

return config