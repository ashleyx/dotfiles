-- functions in this config need to be appropriately called in plugins.lua
--local highlight = {
    --"RainbowRed",
    --"RainbowYellow",
    --"RainbowBlue",
    --"RainbowOrange",
    --"RainbowGreen",
    --"RainbowViolet",
    --"RainbowCyan",
--}
local highlight = {
    "CursorColumn",
    "Whitespace",
}

--local hooks = require "ibl.hooks"
---- create the highlight groups in the highlight setup hook, so they are reset
---- every time the colorscheme changes
--hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    --vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    --vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    --vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    --vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    --vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    --vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    --vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
--end)

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
			theme = 'catppuccin'
			--theme = 'palenight'
		}}
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
		require("bufferline").setup{
			options = {
				mode = "tabs",
				separator_style = "thick",
				tab_size = 25,
			},
	}
	end,

	indentline = function()
		require("ibl").setup {
			indent = { highlight = highlight, char = "" },
			whitespace = {
				highlight = highlight,
				remove_blankline_trail = false,
			},
			scope = { enabled = false },
			--space_char_blankline = " ",
			--show_current_context = true,
			--show_current_context_start = true,
			--filetype_exclude = { "dashboard" },
		}
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
