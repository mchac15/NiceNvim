-- return {
--   "ellisonleao/gruvbox.nvim",
--   priority = 1000,
--   config = true,
--   opts = function()
--     -- Default options:
--     require("gruvbox").setup({
--       terminal_colors = true, -- add neovim terminal colors
--       undercurl = true,
--       underline = true,
--       bold = true,
--       italic = {
--         strings = true,
--         emphasis = true,
--         comments = true,
--         operators = false,
--         folds = true,
--       },
--       strikethrough = true,
--       invert_selection = false,
--       invert_signs = false,
--       invert_tabline = false,
--       invert_intend_guides = false,
--       inverse = true, -- invert background for search, diffs, statuslines and errors
--       contrast = "", -- can be "hard", "soft" or empty string
--       palette_overrides = {},
--       overrides = {},
--       dim_inactive = false,
--       transparent_mode = false,
--     })
--     vim.cmd("colorscheme gruvbox")
--   end,
-- }
--
  local opt = {
  	compile = false, -- enable compiling the colorscheme
  	undercurl = true, -- enable undercurls
  	commentStyle = { italic = true },
  	functionStyle = {},
  	keywordStyle = { italic = true },
  	statementStyle = { bold = true },
  	typeStyle = {},
  	transparent = false, -- do not set background color
  	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
  	terminalColors = true, -- define vim.g.terminal_color_{0,17}
  	colors = { -- add/modify theme and palette colors
  		palette = {
        -- peachRed="#CBC3E3"
      },
  		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  	},
  	overrides = function(colors) -- add/modify highlights
  		return {}
  	end,
  	theme = "wave", -- Load "wave" theme when 'background' option is not set
  	background = { -- map the value of 'background' option to a theme
  		dark = "wave", -- try "dragon" !
  		light = "lotus",
  	},
  }
  return {
  	"rebelot/kanagawa.nvim",
  	priority = 10000,
  	name = "kanagawa",
  	config = function()
      require('kanagawa').setup(opt)
  		vim.cmd.colorscheme("kanagawa")
  	end,
  }
