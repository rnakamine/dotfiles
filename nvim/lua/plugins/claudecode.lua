return {
    "coder/claudecode.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        { "<Leader>ac", "<Cmd>ClaudeCode<CR>",           desc = "Toggle Claude Code" },
        { "<Leader>af", "<Cmd>ClaudeCodeFocus<CR>",      desc = "Focus Claude Code" },
        { "<Leader>ab", "<Cmd>ClaudeCodeAdd %<CR>",      desc = "Add current buffer" },
        { "<Leader>as", "<Cmd>ClaudeCodeSend<CR>",       mode = "v",                 desc = "Send selection" },
        { "<Leader>aa", "<Cmd>ClaudeCodeDiffAccept<CR>", desc = "Accept Claude diff" },
        { "<Leader>ad", "<Cmd>ClaudeCodeDiffDeny<CR>",   desc = "Deny Claude diff" },
    },
}
