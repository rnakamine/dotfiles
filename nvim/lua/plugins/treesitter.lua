return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "go",
      "lua",
      "python",
      "json",
      "yaml",
      "terraform",
      "vim",
      "vimdoc",
      "bash",
    })
  end,
}
