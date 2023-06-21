--[[
__      ________ _   _  ____  __  __
\ \    / /  ____| \ | |/ __ \|  \/  |
 \ \  / /| |__  |  \| | |  | | \  / |
  \ \/ / |  __| | . ` | |  | | |\/| |
   \  /  | |____| |\  | |__| | |  | |
    \/   |______|_| \_|\____/|_|  |_|

		~ A venomous neovim config
--]]

-- Bootstrap Lazy
require("venom.lazy")

-- Load autocompletions
require("venom.lsp")
-- Load theming support
require("venom.theme")
-- Load nvim options
require("venom.options")
-- Load user set keybindings
require("venom.keybinds")
-- Load debugger
require("venom.dap")
-- Load formatter
require("venom.formatter")
-- Load startup configurations
require("venom.startup")
