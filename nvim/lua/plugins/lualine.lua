return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  config = function()
    require("lualine").setup({
      options = {
        -- theme = "catppuccin",
        theme = 'onedark',
        globalstatus = true,
      },
      sections = {
        lualine_b = {
          "branch",
          "diff",
          "diagnostics",
        },
        lualine_c = {
          { "filename", path = 1 },
        },
        lualine_x = {
          "filetype",
        },
      },
    })
  end,
}
