local M = {}

function M.get_install_dir()
  local config_dir = os.getenv('TESSERACTNVIM_INSTALL_DIR')
  if not config_dir then
    return vim.fn.stdpath('config')
  end
  return config_dir
end

-- update instance of TesseractNvim
function M.update()
  local Logger = require('tesseract.utils.logger')
  local Job = require('plenary.job')
  local path = M.get_install_dir()
  local errors = {}

  Job
    :new({
      command = 'git',
      args = { 'pull', '--ff-only' },
      cwd = path,
      on_start = function()
        Logger:log('Updating...')
      end,
      on_exit = function()
        if vim.tbl_isempty(errors) then
          Logger:log('Updated! Running TesseractReloadSync...')
          M.reload_user_config_sync()
        else
          table.insert(errors, 1, 'Something went wrong! Please pull changes manually.')
          table.insert(errors, 2, '')
          Logger:error('Update failed!', { timeout = 30000 })
        end
      end,
      on_stderr = function(_, err)
        table.insert(errors, err)
      end,
    })
    :sync()
end

return M
