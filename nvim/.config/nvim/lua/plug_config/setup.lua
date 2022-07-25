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


-- #f0fa
-- #ffff
-- #fff
--


	colorizer = function()
		require 'colorizer'.setup()
	end,

	terminal = function()
		require('nvim-terminal').setup{
			window = {
				-- Do `:h :botright` for more information
				-- NOTE: width or height may not be applied in some "pos"
				position = 'botright',
				-- Do `:h split` for more information
				split = 'sp',
				-- Width of the terminal
				width = 50,
				-- Height of the terminal
				height = 15,
			},
			-- keymap to disable all the default keymaps
			disable_default_keymaps = false,
			-- keymap to toggle open and close terminal window
			toggle_keymap = '<leader>;',
			-- increase the window height by when you hit the keymap
			window_height_change_amount = 2,
			-- increase the window width by when you hit the keymap
			window_width_change_amount = 2,
			-- keymap to increase the window width
			increase_width_keymap = '<leader><leader>+',
			-- keymap to decrease the window width
			decrease_width_keymap = '<leader><leader>-',
			-- keymap to increase the window height
			increase_height_keymap = '<leader>+',
			-- keymap to decrease the window height
			decrease_height_keymap = '<leader>-',
			terminals = {
				-- keymaps to open nth terminal
				{keymap = '<leader>1'},
				{keymap = '<leader>2'},
				{keymap = '<leader>3'},
				{keymap = '<leader>4'},
				{keymap = '<leader>5'},
			},
		}
		end,

	template = function()
		print('insert code here')
	end,

}

return configs
