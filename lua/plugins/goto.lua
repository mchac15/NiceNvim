return {
  "rmagatti/goto-preview",
  config = function()
    require("goto-preview").setup({})
    vim.keymap.set("n", "<leader>gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
    vim.keymap.set("n", "<leader>gi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", { noremap = true })
    vim.keymap.set("n", "<leader>gy", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", { noremap = true })
    vim.keymap.set("n", "<leader>gr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { noremap = true })
    vim.keymap.set("n", "<leader>gn", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", { noremap = true })
  end,
}
