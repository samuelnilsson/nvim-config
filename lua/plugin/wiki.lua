local wiki_paths_env = os.getenv('NVIM_WIKIS')
-- vim.g.vimwiki_list = {}
local wikis = {}

if wiki_paths_env ~= nil then
	for wiki in wiki_paths_env:gmatch("[^:]+") do
		table.insert(wikis, {
			path = wiki,
			syntax = 'markdown',
			ext = 'md'
		})
	end
end

vim.g.vimwiki_list = wikis
