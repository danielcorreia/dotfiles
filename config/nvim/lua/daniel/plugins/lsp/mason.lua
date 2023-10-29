return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "ansiblels",
        "bashls",
        "cssls",
        "denols",
        "dockerls",
        "emmet_ls",
        "graphql",
        "html",
        "lua_ls",
        "marksman",
        "pyright",
        "tsserver",
        "yamlls",
      },
      automatic_installation = true
    })
  end,
}
