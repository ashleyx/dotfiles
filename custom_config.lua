
vim.cmd[[ autocmd! TermOpen term://* startinsert ]]


return require('packer').startup(function(use)

	use {'glepnir/dashboard-nvim', -- dashboard on vim startup 
		config = function()
			local home = os.getenv('HOME')
			local db = require('dashboard')
			db.preview_command = 'cat'
			db.preview_file_path = home .. '/.config/nvim/lua/dash/image.txt'
			db.preview_file_height = 18
			db.preview_file_width = 100
	end
	}
	
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all useins
  if packer_bootstrap then
    require('packer').sync()
  end
end)



