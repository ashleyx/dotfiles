
-- ALL elements in this dict is always executed as a funcntion in init.lua

configs = {

	--nvimtree = function()
		--require("nvim-tree").setup{  
			--sort_by = "case_sensitive",
			--view = {
				--adaptive_size = true,
				--mappings = {list = {
					--{ key = "<CR>", action = "tabnew" }}},
				--side = "right",
		--}
	--}
	--end,

	filebrowser = function()
		require("telescope").load_extension "file_browser"
	end,
	

	template = function()
		-----------------
	end,
}

return configs
