return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				auto_integrations = true,
			})

			local theme_file = vim.fn.stdpath("data") .. "/current_theme"

			local function save_theme(theme)
				local f = io.open(theme_file, "w")
				if f then
					f:write(theme)
					f:close()
				end
			end

			local function load_theme()
				local f = io.open(theme_file, "r")
				if f then
					local theme = f:read("*a")
					f:close()
					if theme and theme:match("everforest") then
						return "everforest"
					end
				end
				return "catppuccin"
			end

			-- Apply saved theme or default
			vim.cmd.colorscheme(load_theme())

			-- Toggle between Catppuccin and Everforest
			vim.keymap.set("n", "<leader>tt", function()
				if vim.g.colors_name == "everforest" then
					vim.cmd.colorscheme("catppuccin")
					save_theme("catppuccin")
				else
					vim.cmd.colorscheme("everforest")
					save_theme("everforest")
				end
			end, { desc = "[T]oggle [T]heme" })
		end,
	},
}
