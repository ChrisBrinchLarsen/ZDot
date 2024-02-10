local Z={
    [1]="nvim-lualine/lualine.nvim",      -- Requesting a plugin is assumed to be from a github repo so the syntax is "username/repository"
    --name = "",          -- A custom name alias for the plugin used for the directory and as display name in lazy.nvim UI
    --lazy = false,       -- When true, the plugin will only be loaded when needed. Lazy-loaded plugins are automatically loaded when their Lua modules are 'required', or when one of the lazy-loading handlers triggers
    --enabled = true,     -- When false, or if the function returns false, then this plugin will not be included in the spec
    --pin = false         -- When true, this plugin will not be included in updates
    --branch = "",        -- Branch of the repository
    --tag = "",           -- Tag of the repository
    --commit = "",        -- Commit of the repository
    --version = "",       -- Version to use from the repository
    --submodules = true   -- When false, git submodules will not be fetched. Defaults to true
    --priority = 1000,    -- Only useful for start plugins (lazy=false) to force loading certain plugins first. Default priority is 50. It's recommended to set this to a high number for colorschemes.
    --dir = "",           -- A directory pointing to a local plugin
    --url = "",           -- A custom git url where the plugin is hosted
    --dev = false,        -- When true, a local pluging directory will be used instead
    --cond = ture,        -- When false, or if the function returns false, then this plugin will not be loaded. Useful to disable some plugins in vscode, or firenvim for example.
    dependencies = { "nvim-tree/nvim-web-devicons" },
    --init = function() end, -- init functions are always executed during startup
    --opts = {},          -- opts should be a table (will be merged with parent specs), return a table (replaces parent specs) or should change a table. The table will be passed to the Plugin.config() function. Setting this value will imply Plugin.config()
    --main = "",          -- You can specify the main module to use for config() and opts(), in case it can not be determined automatically. See config()
    --build = func or string, -- build is executed when a plugin is installed or updated. Before running build, a plugin is first loaded. If it's a string it will be ran as a shell command. When prefixed with : it is a Neovim command. You can also specify a list to executed multiple build commands. Some plugins provide their own build.lua which is automatically used by lazy. So no need to specify a build step for those plugins.
    --module = false,     -- When true, do not automatically load this Lua module when it's required somewhere
    --event = "",         -- Lazy-load on event. Events can be specified as BufEnter or with a pattern like BufEnter *.lua
    --cmd = "",           -- Lazy-load on command
    --ft = "",            -- Lazy-load on filetype
    --keys = "",          -- Lazy-load on key mapping
    config = function()
        require("lualine").setup({
            options = {theme = "auto"}, -- Themes at: https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
        })
    end,
}
return Z
