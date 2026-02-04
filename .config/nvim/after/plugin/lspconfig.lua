-- LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local set = vim.keymap.set
    local opts = { buffer = args.buf }
    set("n", "gd", vim.lsp.buf.definition, opts)
    set("n", "K", vim.lsp.buf.hover, opts)
    set("n", "<C-m>", vim.lsp.buf.signature_help, opts)
    set("n", "gy", vim.lsp.buf.type_definition, opts)
    set("n", "rn", vim.lsp.buf.rename, opts)
    set("n", "ma", vim.lsp.buf.code_action, opts)
    set("n", "gr", vim.lsp.buf.references, opts)
    set("n", "<space>e", vim.diagnostic.open_float, opts)
    set("n", "[d", vim.diagnostic.goto_prev, opts)
    set("n", "]d", vim.diagnostic.goto_next, opts)
  end,
})

-- Mason setup for LSP server installation
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "glsl_analyzer",
    "ts_ls",
  },
  automatic_enable = true,
})

-- LSP server configurations
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = {
          "vim",
          "require",
        },
      },
    },
  },
})

-- Enable cmp_nvim_lsp capabilities for all servers
vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
