return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "lua_ls", "pyright", "jdtls", "tsserver" }, -- Removed kotlin_language_server
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.tsserver.setup({ capabilities = capabilities })

      -- Simplified jdtls configuration for Kotlin
      lspconfig.jdtls.setup({
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
        cmd = {
          "java", 
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.level=INFO",
          "-javaagent:" .. "/path/to/lombok.jar", -- Optional: Adjust the path to your Lombok jar if you use Lombok
          "-Xmx1g",
          "-jar", 
          "/path/to/eclipse.jdt.ls-<version>.jar", -- Adjust path to your JDT LS jar
          "-configuration", 
          "/path/to/config_linux", -- Adjust path to your config directory
        },
      })

      -- Key mappings
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
  {
    "jayp0521/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { "black" },
      })
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.black,
        },
      })
      vim.keymap.set("n", "<leader>gf", function()
        vim.lsp.buf.format({ async = true })
      end, { desc = "Format with LSP" })
    end,
  },
  -- Rest of your configuration...
}
