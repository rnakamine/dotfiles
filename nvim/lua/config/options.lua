local opt = vim.opt

opt.fileencoding = "utf-8"
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true

opt.number = true
opt.cursorline = true
opt.showmatch = true
opt.visualbell = true
opt.wrap = false
opt.virtualedit = "onemore"

opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4

opt.clipboard:append("unnamedplus")
opt.splitbelow = true
opt.splitright = true
opt.hlsearch = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    local bo = vim.bo
    bo.tabstop = 2
    bo.softtabstop = 2
    bo.shiftwidth = 2
    bo.expandtab = true
  end,
})
