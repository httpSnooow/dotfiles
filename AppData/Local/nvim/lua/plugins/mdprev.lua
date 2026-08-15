return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    -- vim.g.mkdp_browser = "/usr/bin/firefox"
  end,
  ft = { "markdown" },
  config = function()
    vim.keymap.set("n", "<leader>mdn", ":MarkdownPreview<CR>")
    vim.keymap.set("n", "<leader>mds", ":MarkdownPreviewStop<CR>")

    local nvim_cfg = vim.fn.stdpath("config")
    vim.g.mkdp_markdown_css = nvim_cfg .. "/assets/md.css"
    vim.g.mkdp_highlight_css = nvim_cfg .. "/assets/mdhl.css"
  end,
}
