return {
  "lambdalisue/fern.vim",
  dependencies = {
    "lambdalisue/fern-hijack.vim",
    "lambdalisue/fern-git-status.vim",
  },
  lazy = false,
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.g["fern#default_hidden"] = 1
    vim.g["fern#default_exclude"] = "\\.DS_Store"

    vim.keymap.set("n", "<C-f>", "<Cmd>Fern . -drawer -toggle<CR>",
      { silent = true, desc = "Toggle file explorer" })
    vim.keymap.set("n", "fd", function()
      if vim.bo.filetype == "fern" then
        vim.cmd("buffer #")
      else
        vim.cmd("Fern . -reveal=%")
      end
    end, { silent = true, desc = "Toggle fullscreen file explorer revealing current file" })
  end,
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "fern",
      group = vim.api.nvim_create_augroup("fern_keymaps", { clear = true }),
      callback = function()
        local opts = { silent = true, buffer = true }
        vim.keymap.set("n", "q", "<Cmd>q<CR>", opts)
      end,
    })
  end,
}
