return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "onedark",
    },
    sections = {
      lualine_c = {
        { "filename", path = 1 },
      },
    },
  },
}
