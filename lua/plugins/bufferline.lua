return {

    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    -- Colorscheme
    {
        'folke/tokyonight.nvim',
    },

    -- Lualine (THE NEW EXTENSION ADDED IN CONFIGURATION)
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Which-key
    {
        'folke/which-key.nvim',
        lazy = true,
    },

}
