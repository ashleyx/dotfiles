local home = os.getenv('HOME')
local db = require('dashboard')
--db.custom_header = {}
db.preview_command = 'cat | cat '
db.preview_file_path = home .. '/.config/nvim/lua/dash/image.txt'
db.preview_file_height = 18
db.preview_file_width = 100
db.custom_center = {
	{icon = '  ',
	desc = 'Recently latest session     not setup   ',
	shortcut = '<Space> s l',
	action ='SessionLoad'},
	{icon = '  ',
	desc = 'Recently opened files   not setup       ',
	action =  'DashboardFindHistory',
	shortcut = '<Space> h h'},
	{icon = '  ',
	desc = 'Find  File                              ',
	action = 'Telescope find_files find_command=rg,--hidden,--files',
	shortcut = '<Space> f f'},
	{icon = '  ',
	desc ='File Browser                            ',
	action =  'Telescope file_browser',
	shortcut = '<Space> f b'},
	{icon = '  ',
	desc = 'Find  word                              ',
	action = 'Telescope live_grep',
	shortcut = '<Space> f g'},
	{icon = '  ',
	desc = 'Open Personal dotfiles     broken       ',
	action = 'Telescope find_files hidden=true',
	shortcut = '<Space> f d'},
	}
