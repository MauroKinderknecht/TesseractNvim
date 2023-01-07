local tesseract_modules = {
  'tesseract.core.commands',
  'tesseract.core.editor',
  'tesseract.core.mappings',
	'tesseract.core.plugins',
  'tesseract.lsp',
	-- User editor serttings
	'tesseract.config.editor',
}

-- set up lazy.nvim to install plugins
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- import tesseract modules
for _, mod in ipairs(tesseract_modules) do
	local ok, err = pcall(require, mod)
	-- config file may not be present
	if not ok and not mod:find('tesseract.config') then
		error (('Error loading %s...\n\n%s'):format(mod, err))
	end
end
