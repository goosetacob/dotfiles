-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local lsp_installer_servers = require'nvim-lsp-installer.servers'
local language_servers = {
	'sumneko_lua',
	'tsserver',
	'efm',
	'terraformls',
	'gopls',
}

for _, lang in ipairs(language_servers) do
	local ok, lang_serv = lsp_installer_servers.get_server(lang)
	if ok then
		if not lang_serv:is_installed() then
			lang_serv:install()
		end
	end
end
