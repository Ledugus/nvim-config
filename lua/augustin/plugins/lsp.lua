return {
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.opt.signcolumn = "yes"
			local lspconfig_defaults = require("lspconfig").util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				"force",
				lspconfig_defaults.capabilities,
				require("cmp_nvim_lsp").default_capabilities()
			)
			-- Configuration des raccourcis clavier
			-- quand un LSP est attaché
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					-- les keymaps ne sont valables que pour le buffer attaché
					-- (pas de remap)
					local opts = { buffer = event.buf, remap = false }

					vim.diagnostic.config({
						signs = true,
						underline = true,
						update_in_insert = false,
						virtual_text = {
							source = false,
						},
					})
					vim.keymap.set("n", "<leader>vd", function()
						vim.diagnostic.open_float(opts, 0, { scope = "line" })
					end, opts)
					-- Hover = afficher la documentation
					vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
					-- gd = go to definition
					vim.keymap.set("n", "gd", function()
						vim.lsp.buf.definition()
					end, opts)
					-- [d = diagnostic suivant
					vim.keymap.set("n", "<leader>dj", function()
						vim.diagnostic.goto_next()
					end, opts)
					-- ]d = diagnostic précédent
					vim.keymap.set("n", "<leader>dk", function()
						vim.diagnostic.goto_prev()
					end, opts)
					-- Aller aux références
					vim.keymap.set("n", "<leader>vrr", function()
						vim.lsp.buf.references()
					end, opts)
					-- Renommer une variable partout sur le buffer
					vim.keymap.set("n", "<leader>r", function()
						vim.lsp.buf.rename()
					end, opts)

					-- Desactiver la coloration sémantique par les LSP
					local id = vim.tbl_get(event, "data", "client_id")
					local client = id and vim.lsp.get_client_by_id(id)
					client.server_capabilities.semanticTokensProvider = nil
				end,
			})
		end,
	},
	{ "williamboman/mason.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "pyright", "texlab", "lua_ls", "clangd", "ts_ls", "svelte" },
				handlers = {
					-- Handler par défaut
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
					-- Ajouter ici des fonctions nommées selon le LSP concerné
					clangd = function()
						require("lspconfig").clangd.setup({
							cmd = { "clangd", "--fallback-style=webkit" },
						})
					end,
					pyright = function()
						require("lspconfig").pyright.setup({
							settings = {
								python = {
									analysis = {
										typeCheckingMode = "basic",
									},
								},
							},
						})
					end,
				},
			})
			require("mason-tool-installer").setup({
				ensure_installed = {
					"black",
					"stylua",
					"pylint",
					"latexindent",
					"prettier",
				},
			})
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
				},
				mapping = cmp.mapping.preset.insert({

					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
			})
		end,
	},
}
