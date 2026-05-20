return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "saghen/blink.cmp",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local servers = { "gopls", "terraformls", "lua_ls", "jsonls", "yamlls" }

    -- Map lspconfig server names to mason package names where they differ
    local mason_packages = {
      lua_ls = "lua-language-server",
      terraformls = "terraform-ls",
    }

    local registry = require("mason-registry")
    local function ensure_installed()
      for _, server in ipairs(servers) do
        local pkg_name = mason_packages[server] or server
        local ok, pkg = pcall(registry.get_package, pkg_name)
        if ok and not pkg:is_installed() then
          pkg:install()
        end
      end
    end
    registry.refresh(ensure_installed)

    vim.lsp.config("*", {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    vim.lsp.enable(servers)

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
      callback = function(args)
        local opts = function(desc)
          return { buffer = args.buf, desc = desc, silent = true }
        end
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("References"))
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover"))
        vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts("Rename"))
        vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts("Code action"))
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts("Prev diagnostic"))
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts("Next diagnostic"))
        vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts("Show diagnostic"))
      end,
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true }),
      callback = function(args)
        vim.lsp.buf.format({ bufnr = args.buf, async = false })
      end,
    })
  end,
}
