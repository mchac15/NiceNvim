return {
	{
		-- Copilot main plugin
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = true }, -- Enable Copilot inline suggestions
				panel = { enabled = false }, -- Disable the panel for now
			})
		end,
	},
	{
		-- Copilot integration with nvim-cmp
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = {
					-- Tab to accept the current suggestion from LSP or Copilot
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({ select = true }) -- Accept the currently selected suggestion
						elseif require("luasnip").expand_or_jumpable() then
							require("luasnip").expand_or_jump() -- Expand or jump through snippet
						else
							fallback() -- Fallback to default Tab behavior
						end
					end, { "i", "s" }), -- Works in insert and select modes

					-- Shift-Tab to navigate backwards
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item() -- Select the previous item in the suggestion list
						elseif require("luasnip").jumpable(-1) then
							require("luasnip").jump(-1) -- Jump to previous snippet placeholder
						else
							fallback() -- Fallback to Shift-Tab behavior
						end
					end, { "i", "s" }),

					-- Use Up and Down arrow keys to navigate through suggestions
					["<Up>"] = cmp.mapping.select_prev_item(), -- Navigate to the previous suggestion
					["<Down>"] = cmp.mapping.select_next_item(), -- Navigate to the next suggestion

					-- Optional: Disable Enter key to avoid confirmation of suggestions
					["<CR>"] = cmp.mapping(function(fallback)
						fallback() -- Use Enter to insert new line or other default behavior
					end),

					-- Scroll through documentation
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					-- Manually trigger completion
					["<C-Space>"] = cmp.mapping.complete(),

					-- Abort completion
					["<C-e>"] = cmp.mapping.abort(),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- LSP suggestions
					{ name = "luasnip" }, -- Snippet suggestions
					{ name = "copilot" }, -- Copilot suggestions
				}, {
					{ name = "buffer" }, -- Buffer suggestions
				}),
			})
		end,
	},
}
