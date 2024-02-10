-- Setting up lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- ".." is string concatenation.
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath) -- Prepending our lazy.nvim repository path to the neovim run-time-path where neovim will check when it goes looking for answers
-- Require Plugins
local c = "configs/"
require("lazy").setup({       -- Makes neovim look through every entry in the run-time-path for a lazy.lua file or in the case where lazy is a directory, an init.lua file inside that directory
    -- Git
    "tpope/vim-fugitive", -- :Git commands in command mode
    "tpope/vim-sleuth", -- Automatic indent width detection
    -- Color Schemes
    -- require(c.."onedarkpro"),
    -- require(c.."material"), -- Color Scheme
    -- require(c.."tokyo-night"),
    require(c.."nightfox"),
    require(c.."treesitter"), -- Treesitter
    require(c.."treesitter-textobjects"), -- Treesitter Textobjects
    { "williamboman/mason.nvim", lazy = false,},
    { "williamboman/mason-lspconfig.nvim", lazy = false,},
    require(c.."lspconfig"),  -- LSP Configuration
    require(c.."lualine"),    -- Fancy bottom bar 
    require(c.."cmp"),        -- Completion engine
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Fuzzy find module for telescope
    require(c.."telescope"), -- Fuzzy File Finder
    require(c.."nvim-tree"), -- File manager
    require(c.."dashboard"), -- Launch dashboard
    { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end, }, -- Git change annotations
    { "RRethy/vim-illuminate" }, -- Highlight repeat instances of names on hover
    { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } }, -- Lint overviewer
    require(c.."which-key"), -- Keymap overlay
    { "numToStr/Comment.nvim", lazy = false, config = function() require("Comment").setup() end, },
    require(c.."indent-blankline"),
    { "stevearc/dressing.nvim", opts = {} },
    -- { "m4xshen/autoclose.nvim", opts = {}},
    -- { "ggandor/leap.nvim", config = function() require("leap").create_default_mappings() end,},
    -- require(c.."lsp-signature"), -- Argument signature overlay
})
