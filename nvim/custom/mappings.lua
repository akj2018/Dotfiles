local M = {}
-- Keymaps for vim-tmux navigation
M.general = {
	n = {
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Move to window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Move to window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Move to window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Move to window up" },
		["<C-u>"] = { "<C-u>zz", "Jump half a page up" },
		["<C-d>"] = { "<C-d>zz", "Jump half a page down" },
	},
}

-- Keymaps for dap (debugger adapter protocol - general debugging)
M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line",
		},
		["<leader>dus"] = {
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scope)
				sidebar.open()
			end,
			"Open debugging sidebar",
		},
	},
}

-- Keymaps for dab_go (go debugger)
M.dap_go = {
	plugin = true,
	n = {
		["<leader>dgt"] = {
			function()
				require("dap-go").debug_test()
			end,
			"Debug go test",
		},
		["<leader>dgl"] = {
			function()
				require("dap-go").debug_last()
			end,
			"Debug last go test",
		},
	},
}

-- Keymaps for dap_python (python debgger)
M.dap_python = {
	plugin = true,
	n = {
		["<leader>dpr"] = {
			function()
				require("dap-python").test_method()
			end,
			"run python test",
		},
	},
}
-- Keymaps for gopher (go utilities)
M.gopher = {
	plugin = true,
	n = {
		["<leader>gsj"] = {
			"<cmd> GoTagAdd json <CR>",
			"Add json struct tags",
		},
		["<leader>gsy"] = {
			"<cmd> GoTagAdd yaml <CR>",
			"Add yaml struct tags",
		},
	},
}
-- Keymaps for crates (rust packages manager)
M.crates = {
	plugin = true,
	n = {
		["<leader>rcu"] = {
			function()
				require("crates").upgrade_all_crates()
			end,
			"Update crates in cargo file",
		},
	},
}

-- Keymaps for lspsaga
M.lspsaga = {
	plugin = true,
	n = {
		["gh"] = { "<cmd>Lspsaga lsp_finder <CR>", "Find symbol definition" },
		["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "Code action" },
		["gr"] = { "<cmd>Lspsaga rename<CR>", "Rename symbol" },
		["gp"] = { "<cmd>Lspsaga peek_definition<CR>", "Peek definition" },
		["gd"] = { "<cmd>Lspsaga goto_definition<CR>", "Goto definition" },
		["gt"] = { "<cmd>Lspsaga goto_type_definition<CR>", "Peek type definition" },
		["<leader>sl"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Show line diagnostics" },
		["<leader>sb"] = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "Show buffer diagnostics" },
		["<leader>sw"] = { "<cmd>Lspsaga show_workspace_diagnostics<CR>", "Show workspace diagnostics" },
		["<leader>sc"] = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Show cursor diagnostics" },
		["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Go to previous diagnostic" },
		["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Go to next diagnostic" },
		["[E"] = {
			function()
				require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end,
			"Go to previous error diagnostic",
		},
		["]E"] = {
			function()
				require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
			end,
			"Go to next error diagnostic",
		},
		["<leader>o"] = { "<cmd>Lspsaga outline<CR>", "Toggle lspsaga outline" },
		["<leader>ci"] = { "<cmd>Lspsaga incoming_calls<CR>", "Show incoming call hierarchy" },
		["<leader>co"] = { "<cmd>Lspsaga outgoing_calls<CR>", "Show outgoing call hierarchy" },
		["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Open documentation in hover" },
	},
}
return M
