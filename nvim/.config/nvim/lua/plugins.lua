
--ensuring packer install https://github.com/wbthomason/packer.nvim#bootstrapping
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
-- run below in shell once
-- nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'



local custom_configs = require 'plug_config.setup' -- source of custom_configs for plugins

 -- wishlist to add
 -- https://github.com/rmagatti/auto-session
 -- https://github.com/rmagatti/session-lens
 -- https://github.com/s1n7ax/nvim-terminal
 -- https://github.com/michaelb/sniprun
 -- https://github.com/tpope/vim-fugitive
 


return require('packer').startup(function(use)

	use 'wbthomason/packer.nvim'
	-- themes
	--use 'folke/tokyonight.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }
	--
	use { 'nvim-lualine/lualine.nvim', -- statusline
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = custom_configs['lualine'] }
	use {'lewis6991/gitsigns.nvim', -- git diff signs on file
	  config = custom_configs['gitsigns'] }
	use 'tpope/vim-surround' -- add chars like brackets or quotes to regions
	use {'nvim-treesitter/nvim-treesitter', -- better syntax highlighting
		config = custom_configs['treesitter']}
	use 'preservim/tagbar' -- Tagbar for code navigation
	use 'scrooloose/nerdcommenter' -- leader c for commenting
	use {'nvim-telescope/telescope.nvim',-- filename and content search
		requires = 'nvim-lua/plenary.nvim'}
	use { "nvim-telescope/telescope-file-browser.nvim" } -- telescope file browser extension
	use {'akinsho/bufferline.nvim', tag = "v2.*", -- prettier bufferline and movement
		requires = 'kyazdani42/nvim-web-devicons',
		config = custom_configs["bufferline"] }
	use {'kyazdani42/nvim-tree.lua', -- tree style file system movement
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		tag = 'nightly'}
	use {"lukas-reineke/indent-blankline.nvim", -- horizontal indent guide
		config = custom_configs['indentline']}
	use {'glepnir/dashboard-nvim', -- dashboard on vim startup 
		config = function()
			require('dash')
		end}
	use {'norcalli/nvim-colorizer.lua', -- color highlighting for hex values
		config= custom_configs['colorizer']}
	use 'jiangmiao/auto-pairs' -- pair for quotes and brackets when typing 
	use {'s1n7ax/nvim-terminal',
		config = custom_configs['terminal']}
	use 'jpalardy/vim-slime' --send code to terminal
	
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all useins
  if packer_bootstrap then
    require('packer').sync()
  end
end)



