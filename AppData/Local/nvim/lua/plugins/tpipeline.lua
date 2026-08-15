return {
  "vimpostor/vim-tpipeline",
  -- Apenas funciona em tmux (Linux/macOS)
  enabled = vim.fn.has("win32") == 0,
}
