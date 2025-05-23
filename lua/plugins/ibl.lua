-- Indentation marker
-- Repo URL: https://github.com/lukas-reineke/indent-blankline.nvim

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      local ibl = require('ibl')
      ibl.setup {
        scope = {
          enabled = false
        }
      }
    end,
  }
}
