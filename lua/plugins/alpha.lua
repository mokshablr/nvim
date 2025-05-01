-- Alpha Dashboard
-- Repo URL: https://github.com/goolord/alpha-nvim

return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local header = dashboard.section.header
    local buttons = dashboard.section.buttons
    local footer = dashboard.section.footer

    -- Header section
    -- Header Art
    header.val = {
      "                                               /$$              ",
      "                                              | $$              ",
      "  /$$$$$$  /$$  /$$  /$$  /$$$$$$   /$$$$$$  /$$$$$$   /$$   /$$",
      " /$$__  $$| $$ | $$ | $$ /$$__  $$ /$$__  $$|_  $$_/  | $$  | $$",
      "| $$  \\ $$| $$ | $$ | $$| $$$$$$$$| $$  \\__/  | $$    | $$  | $$",
      "| $$  | $$| $$ | $$ | $$| $$_____/| $$        | $$ /$$| $$  | $$",
      "|  $$$$$$$|  $$$$$/$$$$/|  $$$$$$$| $$        |  $$$$/|  $$$$$$$",
      " \\____  $$ \\_____/\\___/  \\_______/|__/         \\___/   \\____  $$",
      "      | $$                                             /$$  | $$",
      "      | $$                                            |  $$$$$$/",
      "      |__/                                             \\______/ ",
      "",
    }

    header.opts.hl = "String"

    -- Button section
    -- Button shortcut coloring
    local buttonhl = function(shortcut, text, command, hl)
      local button = dashboard.button(shortcut, text, command)
      button.opts.hl_shortcut = hl
      return button
    end

    -- Button Menu
    buttons.val = {
      buttonhl("n", "  .zshrc", ":e $HOME/.zshrc<CR>", "@function"),
      buttonhl("f", "  Browse files", ":Telescope find_files<CR>", "@function"),
      buttonhl("r", "󰙮  Obsidian notes", ":e $HOME/Documents/Obsidian Vault<CR>", "@function"),
      buttonhl("s", "  Settings", ":e $HOME/.config<CR>", "@function"),
    }

    -- Footer section
    -- local function footer_info()
    --     local total_plugins = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
    --     return  "   "
    --         .. total_plugins
    --         .. " plugins"
    --         .. "   v"
    --         .. vim.version().major
    --         .. "."
    --         .. vim.version().minor
    --         .. "."
    --         .. vim.version().patch
    -- end

    local function footer_quote(quote)
      return quote
    end
    footer.val = {
      footer_quote("Write code to swap, not to stick."),
      -- footer_info(),
    }

    -- Auto-Padding inspired from (https://github.com/BeyondMagic/MaGiCK/blob/main/config/nvim/lua/plugins/alpha.lua)

    local ol = {                             -- occupied lines
      icon = #header.val,                    -- CONST: number of lines that your header will occupy
      message = #footer.val,                 -- CONST: because of padding at the bottom
      length_buttons = #buttons.val * 2 - 1, -- CONST: it calculate the number that buttons will occupy
      neovim_lines = 2,                      -- CONST: 2 of command line, 1 of the top bar
      padding_between = 3,                   -- STATIC: can be set to anything, padding between keybinds and header
    }

    local left_terminal_value = vim.api.nvim_get_option("lines")
        - (ol.length_buttons + ol.message + ol.padding_between + ol.icon + ol.neovim_lines)

    -- Not screen enough to run the command.
    if left_terminal_value >= 0 then
      local top_padding = math.floor(left_terminal_value / 2)
      local bottom_padding = left_terminal_value - top_padding

      --
      -- Set alpha sections
      --

      dashboard.config = {
        layout = {
          { type = "padding", val = top_padding },
          header,
          { type = "padding", val = ol.padding_between },
          buttons,
          footer,
          { type = "padding", val = bottom_padding },
        },
        opts = {
          margin = 5,
        },
      }
    end

    alpha.setup(dashboard.config)
  end,
}

--         header = {
--             '   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ',
--             '    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
--             '          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ',
--             '           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
--             '          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
--             '   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
--             '  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
--             ' ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
--             ' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ',
--             '      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
--             '       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
--             '',
--         },
--
--
--         header.val = {
--    '░░░░░░░░░░░░░░░░░░░░░░░░░░░░░',
--    '░░░░░░░░░░░░░▄▄▄▄▄▄▄░░░░░░░░░',
--    '░░░░░░░░░▄▀▀▀░░░░░░░▀▄░░░░░░░',
--    '░░░░░░░▄▀░░░░░░░░░░░░▀▄░░░░░░',
--    '░░░░░░▄▀░░░░░░░░░░▄▀▀▄▀▄░░░░░',
--    '░░░░▄▀░░░░░░░░░░▄▀░░██▄▀▄░░░░',
--    '░░░▄▀░░▄▀▀▀▄░░░░█░░░▀▀░█▀▄░░░',
--    '░░░█░░█▄▄░░░█░░░▀▄░░░░░▐░█░░░',
--    '░░▐▌░░█▀▀░░▄▀░░░░░▀▄▄▄▄▀░░█░░',
--    '░░▐▌░░█░░░▄▀░░░░░░░░░░░░░░█░░',
--    '░░▐▌░░░▀▀▀░░░░░░░░░░░░░░░░▐▌░',
--    '░░▐▌░░░░░░░░░░░░░░░▄░░░░░░▐▌░',
--    '░░▐▌░░░░░░░░░▄░░░░░█░░░░░░▐▌░',
--    '░░░█░░░░░░░░░▀█▄░░▄█░░░░░░▐▌░',
--    '░░░▐▌░░░░░░░░░░▀▀▀▀░░░░░░░▐▌░',
--    '░░░░█░░░░░░░░░░░░░░░░░░░░░█░░',
--    '░░░░▐▌▀▄░░░░░░░░░░░░░░░░░▐▌░░',
--    '░░░░░█░░▀░░░░░░░░░░░░░░░░▀░░░',
--    '░░░░░░░░░░░░░░░░░░░░░░░░░░░░░',
--    '',
-- }
--
--header.val = {
--     '                                               /$$              ',
--     '                                              | $$              ',
--     '  /$$$$$$  /$$  /$$  /$$  /$$$$$$   /$$$$$$  /$$$$$$   /$$   /$$',
--     ' /$$__  $$| $$ | $$ | $$ /$$__  $$ /$$__  $$|_  $$_/  | $$  | $$',
--     '| $$  \\ $$| $$ | $$ | $$| $$$$$$$$| $$  \\__/  | $$    | $$  | $$',
--     '| $$  | $$| $$ | $$ | $$| $$_____/| $$        | $$ /$$| $$  | $$',
--     '|  $$$$$$$|  $$$$$/$$$$/|  $$$$$$$| $$        |  $$$$/|  $$$$$$$',
--     ' \\____  $$ \\_____/\\___/  \\_______/|__/         \\___/   \\____  $$',
--     '      | $$                                             /$$  | $$',
--     '      | $$                                            |  $$$$$$/',
--     '      |__/                                             \\______/ ',
--     '',
-- }
--
