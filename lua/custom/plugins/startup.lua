return {
	{
		"startup-nvim/startup.nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope.nvim",
			"ahmedkhalf/project.nvim",
		},
		config = function()
			local function get_palette()
				local name = vim.g.colors_name or ""

				if name == "" or name:lower():match("catppuccin") then
					return {
						icon = "#89b4fa", -- Blue
						text = "#cdd6f4", -- Text
						subtle = "#a6adc8", -- Subtext
					}
				end

				if name:lower():match("everforest") then
					return {
						icon = "#7fbbb3", -- Aqua/Green highlight
						text = "#d3c6aa", -- Foreground
						subtle = "#9da9a0", -- Muted
					}
				end

				return {
					icon = "#89b4fa",
					text = "#cdd6f4",
					subtle = "#a6adc8",
				}
			end

			vim.api.nvim_create_user_command("NeorgNewAction", function()
				local key = vim.api.nvim_replace_termcodes("<Plug>(neorg.dirman.new-note)", true, true, true)
				vim.api.nvim_feedkeys(key, "m", false)
			end, {})

			vim.api.nvim_create_user_command("NeorgFindFiles", function()
				local notes_dir = vim.fn.expand("~/notes")
				if vim.fn.isdirectory(notes_dir) == 0 then
					vim.fn.mkdir(notes_dir, "p")
				end
				require("telescope.builtin").find_files({ cwd = notes_dir, prompt_title = "Find Notes" })
			end, {})

			require("startup").setup({
				theme = nil,
				parts = { "header", "body", "footer" },
				options = {
					cursor_column = 0.5,
				},

				header = {
					type = "text",
					align = "center",
					margin = 3,
					highlight = "StartupHeader",
					content = {
						[[ ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ]],
						[[ ████╗  ██║██║   ██║██║████╗ ████║ ]],
						[[ ██╔██╗ ██║██║   ██║██║██╔████╔██║ ]],
						[[ ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
						[[ ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
						[[ ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
					},
				},

				body = {
					type = "mapping",
					align = "center",
					margin = 4,
					highlight = "StartupBody",
					content = {
						{ "  New File", "enew", "n" },
						{ "  Find File", "Telescope find_files", "f" },
						{ "  Recent Projects", "Telescope projects", "p" },
						{ "  File Explorer", "Neotree toggle", "e" },
						{ "  Open Notes", "NeorgFindFiles", "S" },
						{ "  New Note", "NeorgNewAction", "N" },
						{ "󰗼  Quit", "qa", "q" },
					},
				},

				footer = {
					type = "text",
					align = "center",
					margin = 3,
					highlight = "StartupFooter",
					content = { "startup.nvim" },
				},
			})

			local function apply_highlights()
				local c = get_palette()
				vim.api.nvim_set_hl(0, "StartupHeader", { fg = c.icon })
				vim.api.nvim_set_hl(0, "StartupBody", { fg = c.text })
				vim.api.nvim_set_hl(0, "StartupFooter", { fg = c.subtle })
				vim.api.nvim_set_hl(0, "StartupHiddenCursor", { blend = 100, nocombine = true })
			end

			apply_highlights()

			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = apply_highlights,
			})

			local cursor_group = vim.api.nvim_create_augroup("StartupCursorHide", { clear = true })
			local original_guicursor = vim.go.guicursor

			vim.api.nvim_create_autocmd("FileType", {
				group = cursor_group,
				pattern = "startup",
				callback = function()
					vim.opt.guicursor = "a:StartupHiddenCursor"

					vim.api.nvim_create_autocmd("BufLeave", {
						group = cursor_group,
						buffer = 0,
						once = true,
						callback = function()
							vim.opt.guicursor = original_guicursor
						end,
					})
				end,
			})
		end,
	},
}
