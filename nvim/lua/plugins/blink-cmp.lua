return {
  "saghen/blink.cmp",
  version = "*",
  event = { "InsertEnter", "CmdlineEnter" },
  opts = {
    keymap = { preset = "default" },
    completion = {
      accept = { auto_brackets = { enabled = true } },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}
