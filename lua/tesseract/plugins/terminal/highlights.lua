local set_highlight = require('tesseract.utils.theme').set_highlight

-- terminal highlights
set_highlight('FloatBorder', {
  guibg = 'None',
})

vim.cmd('hi! link FloatermBorder FloatBorder')
