return {
  { "terryma/vim-multiple-cursors" },
  { "tpope/vim-surround" },
  { "kshenoy/vim-signature" },
  { "tpope/vim-commentary" },
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { desc = 'Git Blame' })
    end,
  },
  {
    "easymotion/vim-easymotion",
    config = function()
      vim.g.EasyMotion_smartcase = 1
      vim.keymap.set("", "<leader>e", "<Plug>(easymotion-prefix)")
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    config = function()
      vim.g.tmux_navigator_disable_when_zoomed = 0
    end,
  },
}
