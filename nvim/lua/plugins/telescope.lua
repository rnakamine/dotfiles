return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  cmd = "Telescope",
  keys = {
    { "<Leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<Leader>fg", "<Cmd>Telescope live_grep<CR>",  desc = "Live grep" },
    { "<Leader>fb", "<Cmd>Telescope buffers<CR>",    desc = "Buffers" },
    { "<Leader>fr", "<Cmd>Telescope oldfiles<CR>",   desc = "Recent files" },
    { "<Leader>fh", "<Cmd>Telescope help_tags<CR>",  desc = "Help tags" },
    { "<Leader>fk", "<Cmd>Telescope keymaps<CR>",    desc = "Keymaps" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
      },
    })
    telescope.load_extension("fzf")
  end,
}
