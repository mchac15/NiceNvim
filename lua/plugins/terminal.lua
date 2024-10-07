return {
  {
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = function()
        vim.api.nvim_set_keymap(
          "n",
          "<leader>g",
          "<cmd>lua _lazygit_toggle()<CR>",
          { noremap = true, silent = true }
        )
      end,
    },
  },
}
