return {
    "uga-rosa/translate.nvim",
    cmd = "Translate",
    opts = {
        default = {
            command = "google",
            output = "floating",
        },
    },
    keys = {
        { "<Leader>t", "<Cmd>Translate JA<CR>", mode = { "n", "v" }, desc = "Translate to Japanese" },
    },
}
