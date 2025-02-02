local highlight = {
    "CursorColumn",
    "Whitespace",
}

configs = {

	gitsigns = {
		 signs = {
			add          = { text = '+' },
			change       = { text = 'o' },
			delete       = { text = '-' },
			topdelete    = { text = '‾' },
			changedelete = { text = '~' },
			untracked    = { text = '┆' },
			},
		signcolumn = true},

	lualine = {
		options = {
			theme = 'iceberg_dark'
		}},

	treesitter ={
			  ensure_installed = { "lua", "rust", "python", "dockerfile", "bash", "r" },
			  ignore_install = { "javascript" },
			  auto_install = false,
			  highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			  },
			},

	template = function()
		print('insert code here')
	end,

}

return configs
