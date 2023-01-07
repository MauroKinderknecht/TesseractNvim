if vim.fn.has('nvim-0.8') == 0 then
	error('Need Neovim v0.8+ in order to run Tesseract!')
end

local ok, err = pcall(require, 'tesseract')

if not ok then
  error(('Error loading core...\n\n%s'):format(err))
end
