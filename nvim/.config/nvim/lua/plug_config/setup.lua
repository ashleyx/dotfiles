local highlight = {
    "CursorColumn",
    "Whitespace",
}

configs = {

	gitsigns = function()
		require('gitsigns').setup{
		 signs = {
			add          = { text = '+' },
			change       = { text = 'o' },
			delete       = { text = '-' },
			topdelete    = { text = '‾' },
			changedelete = { text = '~' },
			untracked    = { text = '┆' },
			},
		signcolumn = true}
	end,

	lualine = function()
		require('lualine').setup{
		options = {
			theme = 'iceberg_dark'
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

	indentline = function()
		require("ibl").setup {
			indent = { highlight = highlight}
		}
	end,

	bufferline = function()
		require("bufferline").setup{}
	end,

	colorizer = function()
		require 'colorizer'.setup()
	end,

	--dashboard = function()
		--require"startup".setup({
			--theme="dashboard",
			--header = dashboard_header})
	--end,

	template = function()
		print('insert code here')
	end,

}

return configs
