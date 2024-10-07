return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    -- Setting up null-ls
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.ktlint, -- Add this line for Kotlin formatting with ktlint
        --null_ls.builtins.diagnostics.eslint,
        --null_ls.builtins.completion.spell,
      },
    })
    -- Key mapping for formatting
    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format with LSP" })
  end,
}
