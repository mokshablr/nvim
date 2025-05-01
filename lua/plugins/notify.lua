-- Notify
-- Repo URL: https://github.com/rcarriga/nvim-notify

return {
  'rcarriga/nvim-notify',
  config = function()
    local notify = require("notify")

    vim.notify = notify

    notify.setup({
      background_colour = "#000000"
    })
  end
}
