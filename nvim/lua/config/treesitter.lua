-- treesitterのハイライトをファイルタイプごとに有効化する。
-- パーサのインストールは lua/plugins/treesitter.lua 側で行う。
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
