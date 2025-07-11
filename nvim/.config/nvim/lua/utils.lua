------ AUTOCOMMANDS

--- This function is taken from https://github.com/norcalli/nvim_utils
--function nvim_create_augroups(definitions)
    --for group_name, definition in pairs(definitions) do
        --vim.api.nvim_command('augroup '..group_name)
        --vim.api.nvim_command('autocmd!')
        --for _, def in ipairs(definition) do
            --local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            --vim.api.nvim_command(command)
        --end
        --vim.api.nvim_command('augroup END')
    --end
--end

vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  group = "AutoFormat",
  callback = function () vim.cmd(":silent !black % -l 120") end,
})

-- stolen from https://dev.to/voyeg3r/my-ever-growing-neovim-init-lua-h0p
--local autocmds = {
   --packer = {
		--{ "BufWritePost", "plugins.lua", "PackerCompile" };
	--};
	--terminal_job = {
		----{ "TermOpen", "*", "if &buftype == 'terminal' | exec 'normal! i' | endif" };
		----{ "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" };
	--};
--}

--nvim_create_augroups(autocmds)

