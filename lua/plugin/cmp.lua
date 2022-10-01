local cmp = require'cmp'

if cmp == nil then
	return
end

local function expand_or_jump_forwards(fallback)
  compose { "expand", "jump_forwards", "select_next_item" }(fallback)
end

local function jump_backwards(fallback) compose { "jump_backwards", "select_prev_item" }(fallback)
end

local lspkind = require('lspkind')

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		["C-j"] = cmp.mapping(
			function(fallback)
				expand_or_jump_forwards(fallback)
			end,
			{ 'i', 's' }
			),
		['<C-k>'] = cmp.mapping(
			function(fallback)
				jump_backwards(fallback)
			end,
			{ 'i', 's' }
		),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
		{ name = 'ultisnips' },
		{ name = 'path' },
		{ name = 'buffer' },
	}),
	formatting = {
		format = function(entry, vim_item)
			if vim.tbl_contains({ 'path' }, entry.source.name) then
				local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
				if icon then
					vim_item.kind = icon
					vim_item.kind_hl_group = hl_group
					return vim_item
				end
			end
			return lspkind.cmp_format({ with_text = false })(entry, vim_item)
		end
	}
})

cmp.setup.filetype('sql', {
	sources = cmp.config.sources({
		{ name = 'vim-dadbod-completion' },
		{ name = 'ultisnips' },
		{ name = 'path' },
		{ name = 'buffer' },
	})
})

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' },
		{ name = 'buffer' },
	})
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
