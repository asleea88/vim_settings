return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<leader>sn', ':Neotree toggle<CR>', { silent = true })
    require("neo-tree").setup({
      filesystem = {
        group_empty_dirs = true,
        scan_mode = "deep",
      },
      window = {
        mappings = {
          ["o"] = "open",
          ["O"] = "system_open",
          ["oc"] = "none",
          ["od"] = "none",
          ["og"] = "none",
          ["om"] = "none",
          ["on"] = "none",
          ["os"] = "none",
          ["ot"] = "none",
        },
      },
      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.jobstart({ "open", path }, { detach = true })
        end,
      },
    })
  end,
}
