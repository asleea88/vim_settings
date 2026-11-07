return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  keys = {
    { "<leader>sm", "<cmd>MarkdownPreview<cr>", ft = "markdown", desc = "Open Markdown Preview" },
  },
  build = function() vim.fn["mkdp#util#install"]() end,
}
