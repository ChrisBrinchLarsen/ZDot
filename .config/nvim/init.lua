-- Looks for .lua files in our run-time-path, could also be a folder in which case it would look for folder/init.lua
require("options") -- Where we set our global neovim options
require("plugins") -- Where we request plugins using lazy.nvim
require("keymaps") -- Where we set our keymaps


