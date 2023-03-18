--
-- Entrypoint into Neovim configuration
--

-- load in core neovim options
require("user.core.options")

-- load in core neovim keybinds
require("user.core.options")

-- load in core neovim autocommands
require("user.core.autocommands")

-- load in lazy package manager configuration
require("user.lazy")
