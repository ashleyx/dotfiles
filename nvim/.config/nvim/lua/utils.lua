------ AUTOCOMMANDS

--- This function is taken from https://github.com/norcalli/nvim_utils
function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command('augroup '..group_name)
        vim.api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command('augroup END')
    end
end

--vim.api.nvim_create_augroup('TerminalSetup', {clear = true})
--vim.api.nvim_create_autocmd('TermOpen', {
    --group = 'TerminalSetup',
    --pattern = '*',
    --callback = function()
		--if vim.bo.filetype == 'terminal' then
			--vim.opt_local.number = false
			--vim.opt_local.signcolumn = 'no'
			--vim.cmd('startinsert!')
	--end
    --end
--})
--vim.api.nvim_create_autocmd('User DashboardReady') {
 --callback = function()
	 --api.nvim_create_autocmd('BufEnter',{
		--callback = function()
		   --if vim.bo.filetype == 'terminal' then
			   --vim.cmd('startinsert!')
		   --end
		--end
 --})
 --end
--})

-- stolen from https://dev.to/voyeg3r/my-ever-growing-neovim-init-lua-h0p
local autocmds = {
   packer = {
		{ "BufWritePost", "plugins.lua", "PackerCompile" };
	};
	terminal_job = {
		--{ "TermOpen", "*", "if &buftype == 'terminal' | exec 'normal! i' | endif" };
		--{ "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" };
	};
}

nvim_create_augroups(autocmds)

