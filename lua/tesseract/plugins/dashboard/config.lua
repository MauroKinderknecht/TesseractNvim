local db = require('dashboard')
local icons = require('tesseract.utils.icons')

db.custom_header = {
    '',
    '',
    '',
    '',
    '',
    '',
    '    ███        ▄████████    ▄████████    ▄████████    ▄████████    ▄████████    ▄████████  ▄████████     ███      ',
    ' ▀█████████▄   ███    ███   ███    ███   ███    ███   ███    ███   ███    ███   ███    ███ ███    ███ ▀█████████▄ ',
    '    ▀███▀▀██   ███    █▀    ███    █▀    ███    █▀    ███    █▀    ███    ███   ███    ███ ███    █▀     ▀███▀▀██ ',
    '     ███   ▀  ▄███▄▄▄       ███          ███         ▄███▄▄▄      ▄███▄▄▄▄██▀   ███    ███ ███            ███   ▀ ',
    '     ███     ▀▀███▀▀▀     ▀███████████ ▀███████████ ▀▀███▀▀▀     ▀▀███▀▀▀▀▀   ▀███████████ ███            ███     ',
    '     ███       ███    █▄           ███          ███   ███    █▄  ▀███████████   ███    ███ ███    █▄      ███     ',
    '     ███       ███    ███    ▄█    ███    ▄█    ███   ███    ███   ███    ███   ███    ███ ███    ███     ███     ',
    '    ▄████▀     ██████████  ▄████████▀   ▄████████▀    ██████████   ███    ███   ███    █▀  ████████▀     ▄████▀   ',
    '                                                                   ███    ███                                     ',
    '',
    '',
    '',
}

db.default_executive = 'telescope'
db.session_directory = vim.fn.stdpath('data') .. '/sessions'

db.custom_center = {
  find_file = {
    icon = icons.file1,
    desc = '  Find File           <leader>ff',
    action = 'lua require("tesseract.plugins.telescope.mappings").project_files()',
  },
  file_explorer = {
    icon = icons.file2,
    desc = '  File Manager        <C-n>     ',
    action = 'NvimTreeToggle',
  },
  find_string = {
    icon = icons.word,
    desc = '  Grep String         <leader>fs',
    action = 'Telescope grep_string',
  },
  last_session = {
    icon = icons.clock,
    desc = '  Load Session        <leader>sl',
    action = 'lua vim.cmd(":silent RestoreSession")',
  },
}

db.custom_footer = { '💫 github.com/MauroKinderknecht' }