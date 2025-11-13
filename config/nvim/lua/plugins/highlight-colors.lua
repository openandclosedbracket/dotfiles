return {
  "brenoprata10/nvim-highlight-colors",
  event = "VeryLazy",
  config = function()
    vim.opt.termguicolors = true
    require("nvim-highlight-colors").setup({})
  end,
}
