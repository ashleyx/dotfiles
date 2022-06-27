-- functions in this config need to be appropriately called in plugins.lua

configs = {

	gitsigns = function()
		require('gitsigns').setup{
		 signs = {
			add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
			change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
			delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
			topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
			changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
		  },
		signcolumn = true}
	end,

	lualine = function()
		require('lualine').setup{
		options = {
			theme = 'tokyonight'}}
	end,

	treesitter = function()
		require('nvim-treesitter.configs').setup{
			  ensure_installed = { "lua", "rust", "python", "dockerfile", "bash", "r" },
			  sync_install = false,
			  ignore_install = { "javascript" },
			  highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			  }
			}
	end,

	bufferline = function()
		require("bufferline").setup{}
	end,

	indentline = function()
		require("indent_blankline").setup {
			space_char_blankline = " ",
			show_current_context = true,
			show_current_context_start = true}
	end,


	template = function()
		print('insert code here')
	end,

}

return configs
